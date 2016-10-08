LookLike::Matchers.define(
    {
        :name     => :amount,
        :desc     => "amount",
        :select   => lambda{|expected|
          expected.end_with?("amount") || LookLike::Support.amount?(expected) || LookLike::Support.amount_def?(expected)
        },
        :match    => lambda{|actual, expected|
          currency = LookLike::Support.currency_of(expected)
          unless currency == "$"
            actual = actual.sub("$", "x").sub(currency, "$")
          end
          LookLike::Support.amount?(actual)
        }
    })

