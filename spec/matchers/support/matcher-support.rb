require "spec_helper"

describe LookLike::MatcherSupport do
  it "should find spaces in a string" do
    expect(LookLike::MatcherSupport.count_words("Tara")).to equal(0)
    expect(LookLike::MatcherSupport.count_words("Tara Sharma")).to equal(1)
    expect(LookLike::MatcherSupport.count_words("Tara Sharma Khan")).to equal(2)
  end

end
