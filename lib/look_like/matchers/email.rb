LookLike::Matchers.define(
    {
        :name     => :email,
        :desc     => "email",
        :select   => lambda{|selector|
          selector.eql?("email") || LookLike::MatcherSupport.is_email(selector)
        },
        :match    => lambda{|actual|
          LookLike::MatcherSupport.is_email(actual)
        }
    })

