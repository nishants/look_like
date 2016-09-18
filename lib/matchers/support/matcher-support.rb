require "uri"
module LookLike
  class MatcherSupport
    def self.count_words(string)
      string.split(" ").length
    end

    def self.is_url(string)
      !!(string =~ /\A#{URI::regexp}\z/)
    end

    def self.is_loose_url(string)
      if(string.strip.length && string.include?("."))
        string = "http://" + string
      end
      !!(string =~ /\A#{URI::regexp}\z/)
    end

  end
end