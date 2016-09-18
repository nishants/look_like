format = /^[\d]+$/
LookLike::Matchers.define(
    {
        :name     => :number,
        :desc     => "a number",
        :priority => 5,
        :select   => lambda{|keyword|
          format === keyword
        },
        :match    => lambda{|actual|
          format === actual
        }
    })

