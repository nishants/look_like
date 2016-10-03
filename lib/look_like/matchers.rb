
module LookLike
  class Matchers
    @@matchers = []

    def self.define(config)
      @@matchers.push(LookLike::Matchers.new(config))
    end

    def self.find(keyword)
      @@matchers.find { |matcher| matcher.apply(keyword) }
    end

    attr_accessor :name
    attr_accessor :desc
    attr_accessor :select
    attr_accessor :match
    attr_accessor :error

    def initialize(config)
      @name     = config[:name]
      @desc     = config[:desc]
      @selector = config[:select]
      @matcher  = config[:match]
    end

    def error(actual, expected)
      "expected  \"#{actual}\" to look like \"#{expected}\" (#{@desc})"
    end

    def negate_error(actual, expected)
      "Expected     :\"#{actual}\" \nTo look like : \"#{expected}\" (#{@desc})"
    end

    def match(actual, expected)
      @matcher.parameters.length == 2 ? @matcher.call(actual, expected) : @matcher.call(actual);
    end

    def apply(key)
      @selector.call(key)
    end

  end
end