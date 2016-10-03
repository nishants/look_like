module LookLike
  class ArrayMatcher < Matcher

    def initialize(matchers)
      @matchers = matchers
    end


    def match_element(actual, expected)
      @matchers.find { |matcher| matcher.select(expected) }.match(actual, expected)
    end

    def match(actualArray, expectedArray)
      if(actualArray.length > 0 && actualArray[0].is_a?(Array))
        return match_array_of_array(actualArray, expectedArray)
      end
      match_array(actualArray, expectedArray)
    end

    def match_array(actualArray, expectedArray)
      matches = expectedArray.length == actualArray.length
      actualArray.each_with_index { |actual, index|
        expected = expectedArray[index]
        matches = matches && match_element(actual, expected)
      }
      matches
    end

    def match_array_of_array(actualSuperArray, expectedArray)
      matches = true
      actualSuperArray.each_with_index { |actualArray|
        matches = matches && match_array(actualArray, expectedArray)
      }
      matches
    end

    def select(expected)
      expected.is_a? Array
    end

  end

end
