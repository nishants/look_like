LookLike::Matchers.define(
    {
        :name     => :string,
        :desc     => "string",
        :select   => lambda{|expected|
          expected == "string" || expected == "text" || expected == "name"
        },
        :match    => lambda{ |actual|
          actual.strip.length > 0
        }
    })

