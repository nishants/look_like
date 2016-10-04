module LookLike
  class ArrayMatcher < Matcher

    def initialize(matchers)
      @matchers = matchers
    end


    def element_error(actual, expected)
      @matchers.find { |matcher| matcher.select(expected) }.error(actual, expected)
    end


    def match_element(actual, expected)
      @matchers.find { |matcher| matcher.select(expected) }.match(actual, expected)
    end

    def match(actual_array, expected_array)
      match_array(actual_array, expected_array)
    end

    def match_array(actual_array, expected_array)
      matches = expected_array.length == actual_array.length
      actual_array.each_with_index { |actual, index|
        expected = expected_array[index]
        matches = matches && match_element(actual, expected)
      }
      matches
    end

    def select(expected)
      expected.is_a? Array
    end

    def error(actual_array, expected_array)
      message = []
      if (expected_array.length > actual_array.length)
        message.push("Expected #{ expected_array.length } elements, but found #{actual_array.length}.")
        message.push("Expected : [#{ expected_array.join(", ") }]")
        message.push("Found    : [#{ actual_array.join(", ") }]")
        return message.join(". ")
      end
      actual_array.each_with_index { |actual, index|
        expected = expected_array[index]
        message.push(match_element(actual, expected) ? "✓" : "x [#{element_error(actual, expected)}]")
      }
      "[#{message.join(", ")}]"
    end

    def negate_error(actual, expected)
      "#{"Expected not to match." + error(actual, expected)}"
    end

  end

end
