abort('Please run this using `bundle exec rake`') unless ENV["BUNDLE_BIN_PATH"]

require 'html-proofer'

desc "Run HTMLProofer"
task :test do
  options = {
    :ignore_urls => [
      /mikaelkorpela/,
      /hitchwiki/,
      /steemit/
    ],
    :disable_external => true,
    :cache => {
      :timeframe => '7d'
    },
    :typhoeus => {
      :headers => {
        "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36"
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
