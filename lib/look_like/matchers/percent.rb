LookLike::Matchers.define(
    {
        :name     => :percent,
        :desc     => "percent",
        :select   => lambda{|expected|
          expected == "percent" ||  LookLike::Support.percent?(expected)
        },
        :match    => lambda{|actual|
          LookLike::Support.percent?(actual)
        }
    })

