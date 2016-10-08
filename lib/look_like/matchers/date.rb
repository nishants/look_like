LookLike::Matchers.define(
    {
        :name     => :date_time,
        :desc     => "date_time",
        :select   => lambda{|expected|
          LookLike::Support.date?(LookLike::Support.mask_date(expected.nil? ? "" : expected))
        },
        :match    => lambda{|actual, expected|
          LookLike::Support.mask_date(expected).eql?(LookLike::Support.mask_date(actual))
        }
    })

