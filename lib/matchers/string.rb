LookLike::Matchers.define(
    {
        :name     => :string,
        :desc     => "string",
        :priority => LookLike::Matchers.NORMAL_PRIORITY,
        :select   => lambda{|keyword|
          LookLike::MatcherSupport.count_words(keyword) == 1
        },
        :match    => lambda{|actual|
          actual.strip.length > 0
        }
    })

