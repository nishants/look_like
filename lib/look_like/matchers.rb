module LookLike
  class Matchers
    @@matchers = []

    def self.define(config)
      @@matchers.unshift(LookLike::Matcher.new(config))
    end

    def self.find(expected)
      @@matchers.find { |matcher| matcher.select(expected) }
    end
  end

end