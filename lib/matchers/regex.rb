LookLike::Matchers.define({
                              :name     => :not_found,
                              :desc     => "no matcher defined",
                              :priority => 5,
                              :select   => lambda{|keyword|
                                keyword.start_with?("/") && keyword.end_with?("/")
                              },
                              :match    => lambda{|actual, expected|
                                Regexp.new(expected.tr("/", "").strip) === actual
                              }
                          })

