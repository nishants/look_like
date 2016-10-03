LookLike::Matchers.define(
    {
        :name     => :fomatted_dollars,
        :desc     => "formatted dollars",
        :select   => lambda{|keyword|
          LookLike::MatcherSupport.is_amount(keyword)|| keyword.end_with?("amount")
        },
        :match    => lambda{|actual|
          LookLike::MatcherSupport.is_amount(actual)
        }
    })

