LookLike::Matchers.define(
    {
        :name     => :not_found,
        :desc     => "no matcher defined",
        :priority => 10,
        :select   => lambda { |keyword| true },
        :match    => lambda { |actual| false }
    })

