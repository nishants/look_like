format = /^[\d,]+\d$/
LookLike::Matchers.define(
    {
        :name     => :fomatted_number,
        :desc     => "formatted number",
        :priority => 5,
        :select   => lambda{|keyword|
          format === keyword
        },
        :match    => lambda{|actual|
          format === actual
        }
    })

