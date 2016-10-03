module LookLike
  class ArrayMatcher < Matcher

    def initialize(matchers)
      @matchers = matchers
    end


    def self.match_element(actual, expected)
      optionally_empty     = expected.is_a?(String) && expected.end_with?("*") && (actual.nil? || actual.strip.eql?(""))
      expected             = expected.is_a?(String) ? expected.sub("*", "").strip : expected
      expected_and_correct = actual && @matchers.find { |matcher| matcher.select(expected) }.match(actual, expected)
      optionally_empty || expected_and_correct
    end

    def match(actualArray, expectedArray)
      matches = expectedArray.length == actualArray.length
      actualArray.each_with_index { |actual, index|
        expected = expectedArray[index]
        matches = matches && match_element(actual, expected)
      }
      return matches
    end

    def select(expected)
      expected.is_a? Array
    end

  end

end
