LookLike::Matchers.define(
    {
        :name     => :fomatted_number,
        :desc     => "number",
        :select   => lambda{|expected|
          expected == "number" ||  LookLike::Support.number?(expected)
        },
        :match    => lambda{|actual|
          LookLike::Support.number?(actual)
        }
    })