LookLike::Matchers.define(
    {
        :name     => :enum,
        :desc     => "enum",
        :select   => lambda{|expected| LookLike::Support.enum?(expected) },
        :match    => lambda{|actual, expected| LookLike::Support.enum_values(expected).include?(actual) }
    })

