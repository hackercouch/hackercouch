require 'open-uri/cached'
require 'json'

OpenURI::Cache.cache_path = '_cache'

module Jekyll
  class GeoJsonGenerator <  Generator
    BASE_URL = 'https://api.geoapify.com/v1/geocode/search'

    def generate(site)
      result = Hash[
        'type'=> 'FeatureCollection',
        'features'=> []
      ]

      for couch in site.collections['couches'].docs
        data = couch.data
        country = URI.encode_www_form_component data['country'].downcase
        city = URI.encode_www_form_component data['city']
        # https://apidocs.geoapify.com/docs/geocoding/forward-geocoding/#api
        api_key = site.config['GEOAPIFY_KEY'] || ENV['GEOAPIFY_KEY']
        url = BASE_URL + "?filter=countrycode:#{country}&city=#{city}&type=city&limit=1&format=json&apiKey=#{api_key}"
        response = URI.open(url)
        raise "Invalid response from Geoapify CITY=(#{city})" if response.status[0] != '200'
        response = JSON.parse(response.read)
        if response.key?('results') and response['results'].size == 1 then
          d = response['results'][0]
          lon = d['lon']
          lat = d['lat']
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
      File.open('geo.json', 'w') do |file|
        json = JSON.pretty_generate(result)
        file.write(json)
      end
    end
  end
end
