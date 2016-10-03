LookLike::Matchers.define(
    {
        :name     => :fomatted_amount,
        :desc     => "formatted amount",
        :select   => lambda{|keyword|
          LookLike::MatcherSupport.is_amount(keyword)|| keyword.end_with?("amount")
        },
        :match    => lambda{|actual, expected|
          currency = LookLike::MatcherSupport.currency_of(expected)
          LookLike::MatcherSupport.is_amount(actual.sub("$", "x").sub(currency, "$"))
        }
    })

