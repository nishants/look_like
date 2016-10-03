LookLike::Matchers.define(
    {
        :name     => :regex,
        :desc     => "regex ",
        :select   => lambda{|expected|
          expected.start_with?("/") && expected.end_with?("/")
        },
        :match    => lambda{|actual, expected|
          Regexp.new(expected.tr("/", "").strip) === actual
        }
    })

