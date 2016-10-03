module LookLike
  class Matchers
    @@matchers = []

    def self.define(config)
      @@matchers.unshift(LookLike::Matcher.new(config))
    end

    def self.find(expected)
      expected.is_a?(Array) ? LookLike::ArrayMatcher.new(@@matchers) : @@matchers.find { |matcher| matcher.select(expected) }
    end

    def self.match(actual, expected)
      find(expected).match(actual, expected)
    end

    def self.array_error(actualArray, expectedArray)
      message = []
      if(expectedArray.length > actualArray.length)
        message.push("Expected #{ expectedArray.length } elements, but found #{actualArray.length}.")
        message.push("Expected : [#{ expectedArray.join(", ") }]")
        message.push("Found    : [#{ actualArray.join(", ") }]")
        return message.join("\n")
      end
      actualArray.each_with_index { |actual, index|
        expected = expectedArray[index]
        message.push(find(expected).match(actual, expected) ? "Okay" : "#{find(expected).error(actual, expected)}")
      }
      "[#{message.join(", ")}]"
    end

    def self.error(actual, expected)
      expected.is_a?(Array) ? array_error(actual, expected) : find(expected.sub("*", "").strip).error(actual, expected)
    end

    def self.negate_error(actual, expected)
      expected.is_a?(Array) ? array_error(actual, expected) : find(expected.sub("*", "").strip).negate_error(actual, expected)
    end
  end

end