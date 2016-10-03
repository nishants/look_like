require "spec_helper"

describe LookLike::MatcherSupport do
  it "should find spaces in a string" do
    expect(LookLike::MatcherSupport.count_words("Tara")).to equal(1)
    expect(LookLike::MatcherSupport.count_words("Tara Sharma")).to equal(2)
    expect(LookLike::MatcherSupport.count_words("Tara Sharma Khan")).to equal(3)
  end

  it "should validate amounts" do
    expect(LookLike::MatcherSupport.is_amount("$53,23,1.00")).to equal(true)
  end

end
