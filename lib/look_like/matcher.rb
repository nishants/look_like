
module LookLike
  class Matcher
    attr_accessor :name
    attr_accessor :desc
    attr_accessor :priority
    attr_accessor :select
    attr_accessor :match

    def initialize(config)
      @name     = config[:name]
      @desc     = config[:desc]
      @priority = config[:priority]
      @selector = config[:select]
      @matcher  = config[:match]
    end

    def match(actual, expected)
      @matcher.call(actual, expected)
    end

    def select(key)
      @selector.call(key)
    end

  end
end