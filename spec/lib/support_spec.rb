require "spec_helper"

describe LookLike::Support do

  it "should validate amounts" do
    expect(LookLike::Support.amount?("$53,23,1.00")).to equal(true)
    expect(LookLike::Support.amount?("$ 53,23,1.00 ")).to equal(true)
    expect(LookLike::Support.amount?("$ 53,23 ,1.00")).to equal(false)
  end

  it "should validate enums" do
    expect(LookLike::Support.enum?("a/b")).to equal(true)
    expect(LookLike::Support.enum?("a/bcs")).to equal(true)
    expect(LookLike::Support.enum?("a/c/vdsds")).to equal(true)
    expect(LookLike::Support.enum?("/c/vdsds")).to equal(false)
    expect(LookLike::Support.enum?("/c/vdsds/")).to equal(false)
  end

  it "parse enum values" do
    expect(LookLike::Support.enum_values("a/b")).to eq(["a", "b"])
    expect(LookLike::Support.enum_values("one/two/three")).to eq(["one", "two", "three"])
  end

  it "should validate emails" do

    expect(LookLike::Support.email? "one@two.com").to equal(true)
    expect(LookLike::Support.email? "one@two.xyz").to equal(true)
    expect(LookLike::Support.email? "one.abs-absd@two.com").to equal(true)

    expect(LookLike::Support.email? "one.abs/absd@two.com").to equal(false)
    expect(LookLike::Support.email? "one.abs\absd@two.com").to equal(false)

    expect(LookLike::Support.email? "").to equal(false)
    expect(LookLike::Support.email? "  ").to equal(false)
    expect(LookLike::Support.email? "abc.com").to equal(false)
    expect(LookLike::Support.email? "abc.xyz").to equal(false)

    expect(LookLike::Support.enum_values("a/b")).to eq(["a", "b"])
    expect(LookLike::Support.enum_values("one/two/three")).to eq(["one", "two", "three"])
  end

end
