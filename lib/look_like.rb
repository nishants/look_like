require "look_like/version"
require 'rspec/expectations'

module LookLike
  class Matchers
    @@matchers = []
    def self.define(matcher)
      @@matchers.push(matcher)
    end

    def self.find(keyword)
      @@matchers.find { |matcher|
        matcher[:select].call(keyword)
      }
    end

  end
end

require 'matchers/equality'

RSpec::Matchers.define :look_like do |expected|
  messages = {}

  match do |actual|
    messages[actual] = LookLike::Matchers.find(expected)[:match].call(actual, expected)
  end

  def method_name(actual, actual_desc, expected, expected_desc)
    "expected  \"#{actual}\" (#{actual_desc}), \nto look like \"#{expected}\" (#{expected_desc})"
  end

  failure_message do |actual|
    messages[actual]
  end
end

a = Class.new{
  def name
    "manoj"
  end
}
a.name