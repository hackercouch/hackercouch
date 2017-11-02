# See https://github.com/gjtorikian/html-proofer/wiki/Using-HTMLProofer-From-Ruby-and-Travis
abort('Please run this using `bundle exec rake`') unless ENV["BUNDLE_BIN_PATH"]

require 'html-proofer'

desc "Run HTMLProofer"
task :test do
  options = {
    :check_html => true,
    :check_img_http => true,
    :check_opengraph => true,
    :cache => {
      :timeframe => '7d'
    },
    :typhoeus => {
      :headers => {
        "User-Agent" => "Mozilla/5.0 (compatible; Hackercouch-Bot)"
      },
      :followlocation => true,
      :connecttimeout => 3,
      :timeout => 5
    },
    :parallel => {
      :in_processes => 3
    }
  }
  begin
    HTMLProofer.check_directory("_site", options).run
  rescue => msg
    puts "#{msg}"
    exit 1
  end
end

task :default => [:test]
