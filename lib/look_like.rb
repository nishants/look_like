require "look_like/version"
require "look_like/look_like_matcher"
require "look_like/rspec-matcher"
require "look_like/matcher-support"

module LookLike
  class Matchers
    @@matchers = []

    def self.define(config)
      @@matchers.push(LookLike::Matcher.new(config))
    end

    def self.find(keyword)
      @@matchers.find { |matcher| matcher.apply(keyword) }
    end

    def self.load
      require "look_like/matchers/number"
      require "look_like/matchers/formatted-dollars"
      require "look_like/matchers/formatted-number"
      require "look_like/matchers/regex"
      require "look_like/matchers/url"
      require "look_like/matchers/string"
    end

  end
end

LookLike::Matchers.load()