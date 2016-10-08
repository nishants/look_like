LookLike::Matchers.define(
    {
        :name     => :date,
        :desc     => "date",
        :select   => lambda{|expected|
          "date".eql?(expected) || LookLike::Support.date?(LookLike::Support.mask_date(expected.nil? ? "" : expected))
        },
        :match    => lambda{|actual, expected|
          LookLike::Support.mask_date(expected).eql?(LookLike::Support.mask_date(actual)) || ("date".eql?(expected) && LookLike::Support.date?(LookLike::Support.mask_date(actual.nil? ? "" : actual)))
        }
    })

