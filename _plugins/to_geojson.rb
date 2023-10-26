require 'open-uri/cached'
require 'json'

OpenURI::Cache.cache_path = '_cache'

module Jekyll
  class GeoJsonGenerator <  Generator
    BASE_URL = 'http://nominatim.openstreetmap.org/search'

    def generate(site)
      result = Hash[
        'type'=> 'FeatureCollection',
        'features'=> []
      ]

      for couch in site.collections['couches'].docs
        data = couch.data
        country = URI.encode_www_form_component data['country']
        city = URI.encode_www_form_component data['city']
        # https://nominatim.org/release-docs/develop/api/Search/
        # free-form search for the name
        # filter by country
        # output as json
        # restrict to 1 response on the address layer, ignoring POIs, transit options etc
        # and filter by "settlements" (state, cities, towns, villages, neighbourhoods etc)
        url = BASE_URL + "?q=#{city}&countrycodes=#{country}&format=json&layer=address&featureType=settlement&limit=1"
        puts url
        response = URI.open(url)
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
      File.open('geo.json', 'w') do |file|
        json = JSON.pretty_generate(result)
        file.write(json)
      end
    end
  end
end
