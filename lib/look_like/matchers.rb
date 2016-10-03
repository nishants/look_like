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
      optionally_empty     = expected.end_with?("*") && (actual.nil? || actual.strip.eql?(""))
      expected             = expected.sub("*", "").strip
      expected_and_correct = actual && find(expected).match(actual, expected)
      optionally_empty || expected_and_correct
    end

    def self.match_array(actualArray, expectedArray)
      matches = true
      actualArray.each_with_index { |actual, index|
        expected = expectedArray[index]
        matches = matches && match_element(actual, expected)
      }
      return matches
    end


    def self.match(actual, expected)
      expected.is_a?(Array) ? match_array(actual, expected) : match_element(actual, expected)
    end

    def self.array_error(actualArray, expectedArray)
      message = []
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
      find(expected).negate_error(actual, expected)
    end
  end

end