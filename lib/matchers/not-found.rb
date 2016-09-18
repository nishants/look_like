LookLike::Matchers.define({
                              :name     => :not_found,
                              :desc     => "no matcher defined",
                              :priority => 6,
                              :select   => lambda{|keyword|
                                true
                              },
                              :match    => lambda{|actual, expected|
                                false
                              }
                          })

