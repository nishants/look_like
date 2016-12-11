LookLike::Matchers.define(
    {
        :name     => :integer,
        :desc     => "integer",
        :select   => lambda{|expected|
          expected == "integer" ||  LookLike::Support.integer?(expected)
        },
        :match    => lambda{|actual|
          LookLike::Support.integer?(actual)
        }
    })

