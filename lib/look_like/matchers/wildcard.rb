LookLike::Matchers.define(
    {
        :name     => :any_value,
        :desc     => "any value",
        :select   => lambda{|expected|
          expected.strip.eql?("")
        },
        :match    => lambda{|actual, expected|
          true
        }
    })

