require 'json'

module Jekyll
  module ToJsonFilter
    def to_json(input)
      input.to_json
    end
  end
end

Liquid::Template.register_filter(Jekyll::ToJsonFilter)
