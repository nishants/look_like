require "look_like/version"
require "look_like/matcher"

module LookLike
  class Matchers
    @@matchers = []
    def self.define(config)
      @@matchers.push(LookLike::Matcher.new(config))
    end

    def self.find(keyword)
      @@matchers.find { |matcher|
        matcher.select(keyword)
      }
    end

    def self.load
      Dir[File.expand_path(File.join(File.dirname(File.absolute_path(__FILE__)), "matchers")) + "/**/*.rb"].each { |file| require file }
    end

  end
end

LookLike::Matchers.load()