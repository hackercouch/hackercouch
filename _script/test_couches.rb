require 'rubygems'
require 'minitest/autorun'
require './_script/verify_couches'
require 'yaml'
require 'nokogiri'

class TestCouches < Minitest::Test
    def setup
        @couches = Couches.new
        @country_codes = YAML.load_file("./_data/countries.yml")
    end

    def test_front_matter_format
        @couches.all_couches.each do |couch|
            assert_kind_of(Hash, couch["front_matter"], "Incorrect format of front matter in #{couch['file_name']} \nFront Matter -\n#{couch['front_matter']}")
        end 
    end


    def test_city
        @couches.all_couches.each do |couch|
            assert(couch["front_matter"].has_key?("city"), "City field not found in #{couch['file_name']}")
        end 
    end

    def test_country
        @couches.all_couches.each do |couch|
            assert(couch["front_matter"].has_key?("country"), "Country field not found in #{couch['file_name']}")
        end
    end

    def test_email
        @couches.all_couches.each do |couch|
            assert(couch["front_matter"].has_key?("email"), "Email field not found in #{couch['file_name']}")
        end
    end

    def test_country_code
        @couches.all_couches.each do |couch|
            if couch["front_matter"].has_key?("country")
                assert(@country_codes.has_key?(couch["front_matter"]["country"].strip.upcase), 
                       "Invalid country code: #{couch["front_matter"]["country"]} found in #{couch['file_name']}.
                       \nMake sure it is a valid 2 character country code in CAPS.")
            end
        end
    end

    def test_content
        @couches.all_couches.each do |couch|
            html_fragment = Nokogiri::HTML.fragment(couch["content"])
            matches = html_fragment.search("h1") #Checking for HTML tags
            assert(matches.size==0, "Found h1 tag in #{couch['front_matter']['file_name']}: \n#{matches}")
        end
    end
end
