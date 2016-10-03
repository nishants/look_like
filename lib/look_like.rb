require "look_like/version"
require "look_like/matcher"

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
      Dir[File.expand_path(File.join(File.dirname(File.absolute_path(__FILE__)), "matchers")) + "/**/*.rb"].each { |file| require file }
    end

    def self.NORMAL_PRIORITY
      5
    end

  end
end

LookLike::Matchers.load()