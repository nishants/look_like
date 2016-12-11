LookLike::Matchers.define(
    {
        :name     => :float,
        :desc     => "float",
        :select   => lambda{|expected|
          expected == "float" ||  LookLike::Support.float?(expected)
        },
        :match    => lambda{|actual|
          LookLike::Support.float?(actual)
        }
    })

