LookLike::Matchers.define(
    {
        :name     => :string,
        :desc     => "string",
        :select   => lambda{|expected| expected.strip.length > 0 },
        :match    => lambda{|actual| actual.strip.length > 0 }
    })

