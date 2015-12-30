require 'json'

module Jekyll
  module ToGeoJSONFilter
    def to_geojson(couches)
      couches.each do |couch|
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::ToGeoJSONFilter)
