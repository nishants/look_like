module LookLike
  class Matcher
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
      "'#{actual}' does not look like '#{expected}' (#{@desc})"
    end

    def negate_error(actual, expected)
      "Did not expect    :'#{actual}' to look like  : '#{expected}' (#{@desc})"
    end

    def match(actual, expected)
      optionally_empty     = expected.is_a?(String) && expected.end_with?("*") && (actual.nil? || actual.strip.eql?(""))
      expected             = expected.is_a?(String) ? expected.sub("*", "").strip : expected
      optionally_empty || !actual.nil? && (@matcher.parameters.length == 2 ? @matcher.call(actual, expected) : @matcher.call(actual))
    end

    def select(expected, actual)
      expected = expected.sub("*", "").strip
      @selector.parameters.length == 2 ? @selector.call(expected, actual) : @selector.call(expected)
    end

  end

end
