LookLike::Matchers.define(
    {
        :name     => :time_stamp,
        :desc     => "time-stamp",
        :select   => lambda{|expected|
          "timestamp".eql?(expected) || LookLike::Support.time?(LookLike::Support.mask_date(expected.nil? ? "" : expected))
        },
        :match    => lambda{|actual, expected|
          LookLike::Support.mask_date(expected).eql?(LookLike::Support.mask_date(actual)) || ("timestamp".eql?(expected) && LookLike::Support.time?(LookLike::Support.mask_date(actual.nil? ? "" : actual)))
        }
    })

