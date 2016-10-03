require 'rspec/expectations'

RSpec::Matchers.define :look_like do |expected|

  match do |actual|
    LookLike::Matchers.match(actual, expected)
  end

  failure_message do |actual|
    LookLike::Matchers.error(actual, expected)
  end

  failure_message_when_negated do |actual|
    LookLike::Matchers.negate_error(actual, expected)
  end
end