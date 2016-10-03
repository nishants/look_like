format = /^[\d]+$/
LookLike::Matchers.define(
    {
        :name     => :number,
        :desc     => "number",
        :select   => lambda{|keyword|
          format === keyword
        },
        :match    => lambda{|actual|
          format === actual
        }
    })

