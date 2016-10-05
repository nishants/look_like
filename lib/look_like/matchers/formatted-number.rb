format = /^[\d,.]+\d$/
LookLike::Matchers.define(
    {
        :name     => :fomatted_number,
        :desc     => "formatted number",
        :select   => lambda{|expected|
          expected == "number" || format === expected
        },
        :match    => lambda{|actual| format === actual }
    })