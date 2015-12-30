require 'open-uri'
require 'json'

module Jekyll

	class GeoJsonGenerator < Generator
		def generate(site)
			f = File.new("geo.json", "w")
			f.puts '{"type": "FeatureCollection", "features": ['

			couch = site.documents	
			for c in couch
				api_url = URI::encode("http://nominatim.openstreetmap.org/search/#{c.data['country']}/#{c.data['city']}?format=json")
				response = open(api_url)
				if response.status[0] == '200' then
					response = JSON.parse(response.read)
					if response[0] then
						lon = response[0]['lon']
						lat = response[0]['lat']
						loc = "#{c.data['city']}, #{c.data['country']}"
						f.puts '{"type": "Feature", "geometry": {"type": "Point", "coordinates": ['+"#{lon}, #{lat}"+']}, "properties": {"loc": "'+loc+'"}},'
					end
				end
			end
			
			f.puts '{}]}'
			f.close
		end
	end
end
