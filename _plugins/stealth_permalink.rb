require 'digest'

Jekyll::Hooks.register :documents, :pre_render do |document|
  if document.collection.label == 'projects' && document.data['status'] == 'stealth'
    # Generate hashed permalink for stealth projects
    hash = Digest::SHA256.hexdigest(document.data['title'])[0, 8]
    document.data['permalink'] = "/projects/#{hash}/"
  end
end