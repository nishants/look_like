LookLike::Matchers.define(
    {
        :name     => :unkown_matcher,
        :desc     => "unkown matcher",
        :select   => lambda{|expected|
          true
        },
        :match    => lambda{ |actual|
          false
        }
    })

