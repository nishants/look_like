format = /^[\d]+$/
LookLike::Matchers.define(
    {
        :name     => :number,
        :desc     => "number",
        :select   => lambda{|expected| format === expected },
        :match    => lambda{|actual| format === actual }
    })

