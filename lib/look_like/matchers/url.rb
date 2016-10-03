require("uri")

LookLike::Matchers.define(
    {
        :name     => :url,
        :desc     => "url",
        :select   => lambda { |expected| LookLike::Support.url?(expected) },
        :match    => lambda { |actual|
          LookLike::Support.url?(actual) || LookLike::Support.loose_url?(actual)
        }
    })