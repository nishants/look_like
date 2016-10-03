require "uri"
module LookLike
  class Support

    def self.url?(string)
      !!(string =~ /\A#{URI::regexp}\z/)
    end

    def self.amount?(string)
      rounded = string.sub(".", ",").strip
      /^\$[\s]*[\d,]+\d$/ === rounded
    end

    def self.enum?(string)
      /^[^\/]+[\/][^\/]/ === string
    end

    def self.loose_url?(string)
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

    def self.email?(string)
      string.include?("@") && !string.include?("/")  && loose_url?(string)
    end

  end
end