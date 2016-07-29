require 'digest/sha1'

module Jekyll
  module VerifyUserHash
    def verify_user_hash(couch, platform)
      nick = couch['nick']
      platform_nick = couch['platform']
      Digest::SHA1.hexdigest("#{nick}.hackercouch/#{platform}/#{platform_nick}")
    end
  end
end

Liquid::Template.register_filter(Jekyll::VerifyUserHash)
