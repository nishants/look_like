LookLike::Matchers.define(
    {
        :name => :three_words,
        :desc => "three words",
        :priority => 6,
        :select => lambda { |keyword|
          LookLike::MatcherSupport.count_words(keyword) == 3
        },
        :match => lambda { |actual|
          LookLike::MatcherSupport.count_words(actual) == 3
        }
    })

