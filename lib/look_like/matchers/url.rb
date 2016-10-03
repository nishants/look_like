require("uri")

LookLike::Matchers.define(
    {
        :name     => :url,
        :desc     => "url",
        :select   => lambda { |keyword|
          LookLike::MatcherSupport.is_url(keyword)
        },
        :match    => lambda { |actual|
          LookLike::MatcherSupport.is_url(actual) || LookLike::MatcherSupport.is_loose_url(actual)
        }
    })