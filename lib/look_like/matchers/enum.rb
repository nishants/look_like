LookLike::Matchers.define(
    {
        :name     => :list,
        :desc     => "list",
        :select   => lambda{|selector|
          LookLike::MatcherSupport.is_enum(selector)
        },
        :match    => lambda{|actual, expected|
          LookLike::MatcherSupport.enum_values(expected).include?(actual)
        }
    })

