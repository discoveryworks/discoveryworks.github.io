#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'yaml'
require 'fileutils'
require 'date'

class ReadmeSync
  def initialize
    @projects_dir = '_projects'
    @report = []
  end

  def run
    puts "Syncing README content for projects..."
    
    project_files = Dir.glob("#{@projects_dir}/*.md")
    
    project_files.each do |file|
      process_project(file)
    end
    
    generate_report
  end

  private

  def process_project(file)
    content = File.read(file)
    frontmatter, body = parse_frontmatter(content)
    
    project_name = File.basename(file, '.md')
    repo_url = frontmatter['repo'] || frontmatter['url']
    
    if !repo_url || !repo_url.include?('github.com')
      @report << {
        project: project_name,
        status: "no repo URL",
        details: repo_url ? "URL: #{repo_url}" : "No URL found"
      }
      return
    end

    # Extract README content
    readme_content = fetch_readme(repo_url)
    
    if !readme_content
      @report << {
        project: project_name,
        status: "README not found",
        details: "Could not fetch README from #{repo_url}"
      }
      return
    end

    # Check README conformance and extract Why section
    why_section = extract_why_section(readme_content)
    
    if !why_section
      @report << {
        project: project_name,
        status: "non-conforming README",
        details: "No '## Why' section found"
      }
      return
    end

    # Update project file
    update_project_file(file, frontmatter, body, why_section)
    
    @report << {
      project: project_name,
      status: "last updated #{Date.today}",
      details: "Successfully synced Why section"
    }
  end

  def parse_frontmatter(content)
    if content.start_with?('---')
      parts = content.split('---', 3)
      frontmatter = YAML.load(parts[1])
      body = parts[2].strip
    else
      frontmatter = {}
      body = content
    end
    [frontmatter, body]
  end

  def fetch_readme(repo_url)
    # Convert GitHub repo URL to raw README URL
    if repo_url.match(/github\.com\/([^\/]+)\/([^\/]+)/)
      owner, repo = $1, $2
      repo = repo.sub(/\.git$/, '') # Remove .git suffix if present
      
      # Try both README.md and readme.md
      ['README.md', 'readme.md'].each do |filename|
        raw_url = "https://raw.githubusercontent.com/#{owner}/#{repo}/main/#{filename}"
        
        begin
          uri = URI(raw_url)
          response = Net::HTTP.get_response(uri)
          
          if response.code == '200'
            return response.body
          end
        rescue => e
          # Try next filename or fail
        end
      end
    end
    
    nil
  end

  def extract_why_section(readme_content)
    lines = readme_content.split("\n")
    why_start = nil
    why_end = nil
    
    lines.each_with_index do |line, index|
      if line.match(/^##\s+Why/i)
        why_start = index
      elsif why_start && line.match(/^##\s+/)
        why_end = index
        break
      end
    end
    
    if why_start
      why_end ||= lines.length
      why_lines = lines[why_start...why_end]
      return why_lines.join("\n").strip
    end
    
    nil
  end

  def update_project_file(file, frontmatter, body, why_section)
    # Check if there's existing auto-generated content
    existing_why_match = body.match(/<!-- START AUTO-GENERATED WHY.*?END AUTO-GENERATED WHY -->/m)
    
    logline = frontmatter['description']
    new_content_parts = []
    
    # Add logline if it exists
    if logline && !logline.empty?
      new_content_parts << logline
      new_content_parts << ""
    end
    
    # Add Why section with markers
    timestamp = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    new_content_parts << "<!-- START AUTO-GENERATED WHY (#{timestamp}) -->"
    new_content_parts << why_section
    new_content_parts << "<!-- END AUTO-GENERATED WHY -->"
    
    if existing_why_match
      # Replace existing auto-generated content
      updated_body = body.sub(existing_why_match[0], new_content_parts.join("\n"))
    else
      # Check if there's other content
      clean_body = body.strip
      if clean_body.empty?
        # No existing content, just add our content
        updated_body = new_content_parts.join("\n")
      else
        # There's existing content - add our content at the top and alert user
        updated_body = new_content_parts.join("\n") + "\n\n" + body
        puts "⚠️  #{file}: Added Why section to existing content. Please review manually."
      end
    end
    
    # Reconstruct file
    new_file_content = "---\n#{frontmatter.to_yaml.sub(/^---\n/, '')}---\n\n#{updated_body}\n"
    
    File.write(file, new_file_content)
  end

  def generate_report
    puts "\n" + "="*60
    puts "SYNC REPORT"
    puts "="*60
    
    # Generate markdown table
    table = "| Project | Status | Details |\n"
    table += "|---------|---------|----------|\n"
    
    @report.each do |row|
      table += "| #{row[:project]} | #{row[:status]} | #{row[:details]} |\n"
    end
    
    puts table
    puts "\nTotal projects: #{@report.length}"
    
    # Write report to file
    File.write('readme_sync_report.md', table)
    puts "Report saved to readme_sync_report.md"
  end
end

# Run the sync
if __FILE__ == $0
  ReadmeSync.new.run
end