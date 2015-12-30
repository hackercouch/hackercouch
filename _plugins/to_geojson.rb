require 'open-uri'
require 'json'
require 'pp'
module Jekyll
  class GeoJsonGenerator <  Generator
    BASE_URL = 'http://nominatim.openstreetmap.org/search/'

    def generate(site)
      result = Hash[
        'type'=> 'FeatureCollection',
        'features'=> []
      ]

      for couch in site.collections['couches'].docs
        data = couch.data
        url = BASE_URL + "#{data['country']}/#{data['city']}?format=json"
        puts "Hitting #{url}"
        api_url = URI::encode(url)

        response = open(api_url)
        raise 'Invalid response from nominatim' if response.status[0] != '200'
        response = JSON.parse(response.read)

        if response[0] then
          lon = response[0]['lon']
          lat = response[0]['lat']
          loc = "#{data['city']}, #{data['country']}"
          result['features'] << Hash[
            'type'=> 'Feature',
            'geometry'=> Hash[
              'type'=> 'Point',
              'coordinates'=> [lon, lat],
            ],
            'properties'=> Hash[
              'loc'=> loc
            ]
          ]
        end
      end

      # Write the json to a file
      File.open('_site/geo.json', 'w') do |file|
        json = JSON.pretty_generate(result)
        file.write(json)
      end
    end
  end
end
