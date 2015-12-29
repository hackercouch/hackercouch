#!/bin/bash
# script to make geojson of all the couches during build
json_value(){
	python -c "import json,sys;obj=json.load(sys.stdin);print obj[0][\"$1\"];"
}

# wring json
echo '{
	"type": "FeatureCollection",
    "features": [' >geojson.json

for couch in ./_couches/*; do
	# converting required yaml front matter into script variable
	nick=$(basename "$couch" .md)
	sed -e '/^c/! d;' -e 's/:[^:\/\/]/="/g;s/$/"/g;s/ *=/=/g;s/ *#/" #/g;' $couch >$nick.sh
	source $nick.sh
	loc="$city, $country"

	#geocoding
	url=$(echo -n "http://nominatim.openstreetmap.org/search/$country/$city?format=json" | sed 's/ /%20/g;s/,//g')
	jsonData=$(curl "$url")
	if [ "$jsonData" != "[]" ]; then
		#echo $jsonData
		lat=$(echo -n $jsonData | json_value "lat")
		lon=$(echo -n $jsonData | json_value "lon")
		echo -n '		{
		"type": "Feature",
		"geometry": {"type": "Point", "coordinates": [' >>geojson.json
		echo -n "$lon, $lat" >>geojson.json
		echo -n	']},
		"properties": {"loc": "' >>geojson.json
		echo -n $loc >>geojson.json
		echo '"}
		},' >>geojson.json
	fi
	rm $nick.sh
done
sed '$s/,//' geojson.json >geo.json
echo ']}' >>geo.json
rm geojson.json
