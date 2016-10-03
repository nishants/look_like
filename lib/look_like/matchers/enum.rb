LookLike::Matchers.define(
    {
        :name     => :enum,
        :desc     => "enum",
        :select   => lambda{|selector|
          LookLike::MatcherSupport.is_enum(selector)
        },
        :match    => lambda{|actual, expected|
          LookLike::MatcherSupport.enum_values(expected).include?(actual)
        }
    })

