has_three_words = lambda {|word|
  more_than_two = word.strip.sub(" ", "").include? " "
  more_than_three = word.strip.sub(" ", "").strip.sub(" ", "").include? " "
  more_than_two && !more_than_three
}
LookLike::Matchers.define(
    {
        :name => :three_words,
        :desc => "three words",
        :priority => 6,
        :select => lambda { |keyword|
          has_three_words.call(keyword)

        },
        :match => lambda { |actual|
          has_three_words.call(actual)
        }
    })

