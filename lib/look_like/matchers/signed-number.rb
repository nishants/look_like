LookLike::Matchers.define(
    {
        :name     => :signed_number,
        :desc     => "+-number",
        :select   => lambda{|expected|
          expected == "+-number" ||  LookLike::Support.signed_number?(expected)
        },
        :match    => lambda{|actual|
          LookLike::Support.signed_number?(actual)
        }
    })