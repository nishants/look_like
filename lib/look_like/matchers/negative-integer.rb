LookLike::Matchers.define(
    {
        :name     => :negative_integer,
        :desc     => "-integer",
        :select   => lambda{|expected|
          expected == "-integer" ||  LookLike::Support.negative_integer?(expected)
        },
        :match    => lambda{|actual|
          LookLike::Support.negative_integer?(actual)
        }
    })

