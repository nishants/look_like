format = /^[\d]+$/
LookLike::Matchers.define(
    {
        :name     => :number,
        :desc     => "a number",
        :select   => lambda{|keyword|
          format === keyword
        },
        :match    => lambda{|actual|
          format === actual
        }
    })

