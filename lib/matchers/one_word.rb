LookLike::Matchers.define({
                              :name     => :one_word,
                              :desc     => "one word",
                              :priority => 6,
                              :select   => lambda{|keyword|
                                !keyword.strip.include? " "
                              },
                              :match    => lambda{|actual, expected|
                                !actual.strip.include? " "
                              }
                          })

