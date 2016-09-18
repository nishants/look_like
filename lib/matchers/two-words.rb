LookLike::Matchers.define(
    {
        :name => :two_words,
        :desc => "two words",
        :priority => 6,
        :select => lambda { |keyword|
          !keyword.strip.sub(" ", "").include? " "
        },
        :match => lambda { |actual|
          more_than_one = actual.strip.include? " "
          more_than_two = actual.strip.sub(" ", "").include? " "
          more_than_one && !more_than_two
        }
    })

