require 'digest'

module Jekyll
  class StealthProjectGenerator < Generator
    safe true
    priority :low

    def generate(site)
      stealth_projects = site.collections['projects'].docs.select { |doc| doc.data['status'] == 'stealth' }
      
      stealth_projects.each do |project|
        # Generate hashed URL
        hash = Digest::SHA256.hexdigest(project.data['title'])[0, 8]
        
        # Create new URL structure
        project.data['url'] = "/projects/#{hash}/"
        
        # Update title for display
        project.data['display_title'] = "Stealth Project: #{hash}"
        
        # Replace description with placeholder
        project.data['display_description'] = "█████████ ████████████ ███████"
      end
    end
  end
end