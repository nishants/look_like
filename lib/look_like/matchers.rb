module LookLike
  class Matchers
    @@matchers = []

    def self.define(config)
      @@matchers.unshift(LookLike::Matcher.new(config))
    end

    def self.find(keyword)
      @@matchers.find { |matcher| matcher.apply(keyword) }
    end
  end

end