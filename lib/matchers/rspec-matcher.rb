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