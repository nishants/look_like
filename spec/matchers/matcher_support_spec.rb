require "spec_helper"

describe LookLike::MatcherSupport do
  it "should find spaces in a string" do
    expect(LookLike::MatcherSupport.count_words("Tara")).to equal(1)
    expect(LookLike::MatcherSupport.count_words("Tara Sharma")).to equal(2)
    expect(LookLike::MatcherSupport.count_words("Tara Sharma Khan")).to equal(3)
  end

  it "should validate amounts" do
    expect(LookLike::MatcherSupport.is_amount("$53,23,1.00")).to equal(true)
    expect(LookLike::MatcherSupport.is_amount("$ 53,23,1.00 ")).to equal(true)
    expect(LookLike::MatcherSupport.is_amount("$ 53,23 ,1.00")).to equal(false)
  end

  it "should validate enums" do
    expect(LookLike::MatcherSupport.is_enum("a/b")).to equal(true)
    expect(LookLike::MatcherSupport.is_enum("a/bcs")).to equal(true)
    expect(LookLike::MatcherSupport.is_enum("a/c/vdsds")).to equal(true)
    expect(LookLike::MatcherSupport.is_enum("/c/vdsds")).to equal(false)
    expect(LookLike::MatcherSupport.is_enum("/c/vdsds/")).to equal(false)
  end
  it "parse enum values" do
    expect(LookLike::MatcherSupport.enum_values("a/b")).to eq(["a", "b"])
    expect(LookLike::MatcherSupport.enum_values("one/two/three")).to eq(["one", "two", "three"])
  end

end
