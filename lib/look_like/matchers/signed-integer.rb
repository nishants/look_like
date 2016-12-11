LookLike::Matchers.define(
    {
        :name     => :signed_integer,
        :desc     => "+-integer",
        :select   => lambda{|expected|
          expected == "+-integer" ||  LookLike::Support.signed_integer?(expected)
        },
        :match    => lambda{|actual|
          LookLike::Support.signed_integer?(actual)
        }
    })

