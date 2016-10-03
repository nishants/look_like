require 'rspec/expectations'

RSpec::Matchers.define :look_like do |expected|

  match do |actual|
    optionally_empty     = expected.end_with?("*") && (actual.nil? || actual.strip.eql?(""))
    expected             = expected.sub("*", "").strip
    expected_and_correct = actual && LookLike::Matchers.find(expected).match(actual, expected)
    optionally_empty || expected_and_correct
  end

  failure_message do |actual|
    LookLike::Matchers.find(expected).error(actual, expected)
  end

  failure_message_when_negated do |actual|
    LookLike::Matchers.find(expected).negate_error(actual, expected)
  end
end