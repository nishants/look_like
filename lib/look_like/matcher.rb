
module LookLike
  class Matcher
    attr_accessor :name
    attr_accessor :desc
    attr_accessor :priority
    attr_accessor :select
    attr_accessor :match
    attr_accessor :error

    def initialize(config)
      @name     = config[:name]
      @desc     = config[:desc]
      @priority = config[:priority]
      @selector = config[:select]
      @matcher  = config[:match]
    end

    def error(actual, expected)
      "expected  \"#{actual}\" to look like \"#{expected}\" (#{@desc})"
    end

    def match(actual, expected)
      @matcher.parameters.length == 2 ? @matcher.call(actual, expected) : @matcher.call(actual);
    end

    def apply(key)
      @selector.call(key)
    end

  end
end