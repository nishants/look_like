LookLike::Matchers.define(
    {
        :name     => :equal,
        :desc     => "equal",
        :select   => lambda{|expected, actual|
          expected == actual
        },
        :match    => lambda{|actual, expected|
          expected == actual
        }
    })

