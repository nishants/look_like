require "uri"
module LookLike
  class Support

    @@DATE_CHARS = /[DMYHSmhs\d]/
    @@DATE_STAMP_REGEX = /^[\/x]+$/
    @@TIME_STAMP_REGEX = /^[\/x\-\:TZ\s]+$/

    def self.integer?(value)
       /^[0-9]+$/ === value
    end

    def self.float?(value)
      /^[0-9]*\.[0-9]+$/ === value
    end

    def self.negative_integer?(value)
      value.start_with?("-") && integer?(value.sub("-", "").strip)
    end

    def self.negative_float?(value)
      value.start_with?("-") && float?(value.sub("-", "").strip)
    end

    def self.signed_integer?(value)
      integer?(value.sub("+", "")) || negative_integer?(value)
    end

    def self.url?(string)
      !!(string =~ /\A#{URI::regexp}\z/)
    end

    def self.amount?(string)
      rounded = string.sub(".", ",").strip
      /^\$[\s]*[\d,]+\d$/ === rounded
    end

    def self.normalize_currency(amount)
      (amount.nil? || amount.empty?) ?  "" : amount.sub(currency_of(amount), "$")
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

    def self.amount_def?(expected)
      amount?(expected.sub(/^[^\d]+/, "$"))
    end

    def self.time?(stamp)
      stamp.include?("x") && @@TIME_STAMP_REGEX === stamp
    end

    def self.date?(stamp)
      stamp.include?("x") && @@DATE_STAMP_REGEX === stamp
    end

    def self.mask_date(stamp)
      stamp.gsub(@@DATE_CHARS, "x")
    end

  end
end