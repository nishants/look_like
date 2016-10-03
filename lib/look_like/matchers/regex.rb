LookLike::Matchers.define(
    {
        :name     => :regex,
        :desc     => "regex ",
        :select   => lambda{|keyword|
          keyword.start_with?("/") && keyword.end_with?("/")
        },
        :match    => lambda{|actual, expected|
          Regexp.new(expected.tr("/", "").strip) === actual
        }
    })

