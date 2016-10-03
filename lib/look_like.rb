require "look_like/version"
require "look_like/matcher"
require "look_like/rspec-matcher"
require "look_like/matcher-support"

module LookLike
  class Matchers
    @@matchers = []
    def self.define(config)
      @@matchers.push(LookLike::Matcher.new(config))
      @@matchers = @@matchers.sort_by {|matcher| matcher.priority}
    end

    def self.find(keyword)
      @@matchers.find { |matcher|
        matcher.apply(keyword)
      }
    end

    def self.load
      require "matchers/number"
      require "matchers/string"
      require "matchers/formatted-dollars"
      require "matchers/formatted-number"
      require "matchers/regex"
      require "matchers/url"
    end

    def self.NORMAL_PRIORITY
      5
    end

  end
end

LookLike::Matchers.load()