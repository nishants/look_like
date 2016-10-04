module LookLike
  class NestedArrayMatcher < ArrayMatcher
    def match(actual, expected)
      matches = true
      expected_array = expected[0]
      actual.each { |actual_array|
        matches &&= match_array(actual_array, expected_array)
      }
      matches
    end

    def select(expected)
      expected.is_a?(Array) && expected.length > 0 && expected[0].is_a?(Array)
    end

    def error(actual, expected)
      message = []
      expected_array = expected[0]
      actual.each { |actual_array|
        message.push(match_array(actual_array, expected_array) ? "✓" : "x [#{super(actual_array, expected_array)}]")
      }
      "[#{message.join(", ")}]"
    end
    
  end
end
