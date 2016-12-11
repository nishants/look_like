LookLike::Matchers.define(
    {
        :name     => :signed_float,
        :desc     => "+-float",
        :select   => lambda{|expected|
          expected == "+-float" ||  LookLike::Support.signed_float?(expected)
        },
        :match    => lambda{|actual|
          LookLike::Support.signed_float?(actual)
        }
    })

