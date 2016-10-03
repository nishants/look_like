require "uri"
module LookLike
  class MatcherSupport
    def self.count_words(string)
      string.strip.split(" ").length
    end

    def self.is_url(string)
      !!(string =~ /\A#{URI::regexp}\z/)
    end

    def self.is_amount(string)
      rounded = string.sub(".", ",").strip
      /^\$[\s]*[\d,]+\d$/ === rounded
    end

    def self.is_enum(string)
      /^[^\/]+[\/][^\/]/ === string
    end

    def self.is_loose_url(string)
      if(string.strip.length && string.include?("."))
        string = "http://" + string
      end
      !!(string =~ /\A#{URI::regexp}\z/)
    end

    def self.currency_of(amount)
      amount.end_with?("amount") ? amount.split("amount")[0].strip :  amount[/^[^\d]+/].strip
    end

    def self.enum_values(list)
      list.split("/").map{|value| value.strip()}
    end

  end
end