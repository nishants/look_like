LookLike::Matchers.define(
    {
        :name     => :not_found,
        :desc     => "no matcher defined",
        :select   => lambda { |keyword| true },
        :match    => lambda { |actual| false }
    })

