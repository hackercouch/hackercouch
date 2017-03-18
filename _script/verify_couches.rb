require "rubygems"
require "yaml"
require "front_matter_parser"

class Couches 
    def initialize()
        @all_couches = []
        separate_YAML_content
    end

    #method to print filenames of couches. Useful for debugging.
    def print_couches()
        @couchnames.each do |couch|
            puts couch
        end
    end

    def separate_YAML_content()
        Dir.glob("_couches/*.md").each do |couch|
            temp_couch = {}
            parsed = FrontMatterParser.parse_file(couch)
            temp_couch["file_name"] = couch
            temp_couch["front_matter"] = parsed.front_matter
            temp_couch["content"] = parsed.content
            all_couches.push(temp_couch)
        end
    end

    attr_reader :all_couches
end

if __FILE__ == $0
    couches = Couches.new()
    print couches.all_couches[0]["front_matter"]
end
