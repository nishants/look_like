LookLike::Matchers.define(
    {
        :name     => :one_word,
        :desc     => "one word",
        :priority => 7,
        :select   => lambda{|keyword| LookLike::MatcherSupport.count_words(keyword) == 1 },
        :match    => lambda{|actual| LookLike::MatcherSupport.count_words(actual) == 1 }
    })

