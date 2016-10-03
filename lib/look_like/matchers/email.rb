LookLike::Matchers.define(
    {
        :name     => :email,
        :desc     => "email",
        :select   => lambda{|expected| expected.eql?("email") || LookLike::Support.email?(expected) },
        :match    => lambda{|actual| LookLike::Support.email?(actual) }
    })

