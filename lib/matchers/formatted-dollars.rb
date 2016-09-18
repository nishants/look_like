format = /^$\$[\d,]+\d$/
LookLike::Matchers.define(
    {
        :name     => :fomatted_dollars,
        :desc     => "formatted dollars",
        :priority => 5,
        :select   => lambda{|keyword|
          format === keyword
        },
        :match    => lambda{|actual|
          format === actual
        }
    })

