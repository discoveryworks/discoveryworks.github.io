module Jekyll
  class ImageAttributes < Jekyll::Generator
    safe true
    priority :low

    def generate(site)
      site.pages.each do |page|
        next unless page.respond_to?(:content) && page.content
        page.content = process_content(page.content)
      end

      site.posts.docs.each do |post|
        post.content = process_content(post.content)
      end

      site.collections.each do |collection_name, collection|
        collection.docs.each do |doc|
          doc.content = process_content(doc.content)
        end
      end
    end

    private

    def process_content(content)
      # Convert markdown images with attributes to HTML
      content.gsub(
        /!\[([^\]]*)\]\(([^)]+)\)\{:([^}]+)\}/,
        '<img src="\2" alt="\1" \3>'
      )
    end
  end
end