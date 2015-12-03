require 'pp'
module Jekyll
  module DropKey
    def drop_key(input, key)
      input.delete_if {|k, value| k==key}
    end
  end
end

Liquid::Template.register_filter(Jekyll::DropKey)

Liquid::Template.register_tag('drop_key', Jekyll::DropKey)
