LookLike::Matchers.define(
    {
        :name     => :signed_integer,
        :desc     => "+-integer",
        :select   => lambda{|expected|
          expected == "+-integer"
        },
        :match    => lambda{|actual|
          LookLike::Support.signed_integer?(actual)
        }
    })

