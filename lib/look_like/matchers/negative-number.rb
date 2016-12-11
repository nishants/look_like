LookLike::Matchers.define(
    {
        :name     => :negative_number,
        :desc     => "-number",
        :select   => lambda{|expected|
          expected == "-number" ||  LookLike::Support.negative_number?(expected)
        },
        :match    => lambda{|actual|
          LookLike::Support.negative_number?(actual)
        }
    })