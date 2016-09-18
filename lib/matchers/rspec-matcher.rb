require 'rspec/expectations'

RSpec::Matchers.define :look_like do |expected|

  match do |actual|
    !!actual && (expected === actual  || LookLike::Matchers.find(expected).match(actual, expected))
  end

  failure_message do |actual|
    LookLike::Matchers.find(expected).error(actual, expected)
  end
end