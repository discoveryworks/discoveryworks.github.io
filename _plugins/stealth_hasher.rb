require 'digest'

module Jekyll
  module StealthHasher
    def stealth_hash(input)
      return input unless input.is_a?(String)
      Digest::SHA256.hexdigest(input)[0, 8]
    end
  end
end

Liquid::Template.register_filter(Jekyll::StealthHasher)