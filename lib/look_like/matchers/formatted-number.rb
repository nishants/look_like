format = /^[\d,]+\d$/
LookLike::Matchers.define(
    {
        :name     => :fomatted_number,
        :desc     => "formatted number",
        :select   => lambda{|keyword|
          format === keyword
        },
        :match    => lambda{|actual|
          format === actual
        }
    })