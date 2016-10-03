format = /^[\d,]+\d$/
LookLike::Matchers.define(
    {
        :name     => :fomatted_number,
        :desc     => "formatted number",
        :select   => lambda{|expected| format === expected },
        :match    => lambda{|actual| format === actual }
    })