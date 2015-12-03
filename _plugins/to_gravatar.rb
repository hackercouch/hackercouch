require 'digest/md5'

module Jekyll
  module ToGravatarFilter
    def to_gravatar(input, size=100)
      "//www.gravatar.com/avatar/#{hash(input)}?s=#{size}"
    end

    private :hash
    def hash(email)
      gravatar_email = email ? email.downcase.strip : ''
      Digest::MD5.hexdigest(gravatar_email)
    end
  end
end

Liquid::Template.register_filter(Jekyll::ToGravatarFilter)