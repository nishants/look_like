LookLike::Matchers.define({
                              :name     => :equality,
                              :desc     => "",
                              :priority => 6,
                              :select   => lambda{|keyword|
                                true
                              },
                              :match    => lambda{|actual, expected|
                                actual == expected
                              }
                          })

