LookLike::Matchers.define(
    {
        :name     => :string,
        :desc     => "string",
        :select   => lambda{|keyword|
          keyword.strip.length > 0
        },
        :match    => lambda{|actual|
          actual.strip.length > 0
        }
    })

