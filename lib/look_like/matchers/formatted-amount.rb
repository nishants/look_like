LookLike::Matchers.define(
    {
        :name     => :amount,
        :desc     => "amount",
        :select   => lambda{|keyword|
          keyword.end_with?("amount") || LookLike::MatcherSupport.is_amount(keyword)
        },
        :match    => lambda{|actual, expected|
          currency = LookLike::MatcherSupport.currency_of(expected)
          unless currency == "$"
            actual = actual.sub("$", "x").sub(currency, "$")
          end
          LookLike::MatcherSupport.is_amount(actual)
        }
    })

