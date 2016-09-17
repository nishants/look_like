require "look_like/version"
require 'rspec/expectations'


RSpec::Matchers.define :look_like do |expected|
  messages = {}

  match do |actual|
    actual_desc   = "one word"
    expected_desc = "two words"
    messages[actual] = method_name(actual, actual_desc, expected, expected_desc)
    false
  end

  def method_name(actual, actual_desc, expected, expected_desc)
    "expected  \"#{actual}\" (#{actual_desc}), \nto look like \"#{expected}\" (#{expected_desc})"
  end

  failure_message do |actual|
    messages[actual]
  end
end


module LookLike

end