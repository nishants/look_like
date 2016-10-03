module LookLike
  class Matchers
    @@matchers = []

    def self.define(config)
      @@matchers.unshift(LookLike::Matcher.new(config))
    end

    def self.find(expected)
      @@matchers.find { |matcher| matcher.select(expected) }
    end

    def self.match_element(actual, expected)
      optionally_empty     = expected.is_a?(String) && expected.end_with?("*") && (actual.nil? || actual.strip.eql?(""))
      expected             = expected.is_a?(String) ? expected.sub("*", "").strip : expected
      expected_and_correct = actual && find(expected).match(actual, expected)
      optionally_empty || expected_and_correct
    end

    def self.match_array(actualArray, expectedArray)
      matches = expectedArray.length == actualArray.length
      actualArray.each_with_index { |actual, index|
        expected = expectedArray[index]
        matches = matches && match_element(actual, expected)
      }
      matches
    end

    def self.match_array_of_array(actualSuperArray, expectedArray)
      matches = true
      actualSuperArray.each_with_index { |actualArray|
        matches = matches && match_array(actualArray, expectedArray)
      }
      matches
    end

    def self.match(actual, expected)
      if(expected.is_a?(Array))
        if(actual.length > 0 && actual[0].is_a?(Array))
          return match_array_of_array(actual, expected)
        end
        return match_array(actual, expected)
      end

      match_element(actual, expected)
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
        message.push(match_element(actual, expected) ? "Okay" : "#{find(expected).error(actual, expected)}")
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