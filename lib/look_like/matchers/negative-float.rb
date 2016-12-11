LookLike::Matchers.define(
    {
        :name     => :negative_float,
        :desc     => "-float",
        :select   => lambda{|expected|
          expected == "-float" ||  LookLike::Support.negative_float?(expected)
        },
        :match    => lambda{|actual|
          LookLike::Support.negative_float?(actual)
        }
    })

