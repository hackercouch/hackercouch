require 'json'

module Jekyll
  module ToJsonFilter
    def to_json(input)
      input.to_json
    end
  end
  module AddToHashFilter
    def add_to_hash(input, key, value)
      input[key] = value
      input
    end
  end
end

Liquid::Template.register_filter(Jekyll::ToJsonFilter)
Liquid::Template.register_filter(Jekyll::AddToHashFilter)
