LookLike::Matchers.define(
    {
        :name => :two_words,
        :desc => "two words",
        :priority => 6,
        :select => lambda { |keyword|
          LookLike::MatcherSupport.count_words(keyword) == 2
        },
        :match => lambda { |actual|
          LookLike::MatcherSupport.count_words(actual) == 2
        }
    })

