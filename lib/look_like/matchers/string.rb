LookLike::Matchers.define(
    {
        :name     => :string,
        :desc     => "string",
        :select   => lambda{|expected|
          expected == "string"
        },
        :match    => lambda{ |actual|
          actual.strip.length > 0
        }
    })

