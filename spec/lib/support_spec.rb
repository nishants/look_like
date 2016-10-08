require "spec_helper"

describe LookLike::Support do

  it "should validate amounts" do
    expect(LookLike::Support.amount?("$53,23,1.00")).to equal(true)
    expect(LookLike::Support.amount?("$ 53,23,1.00 ")).to equal(true)
    expect(LookLike::Support.amount?("$ 53,23 ,1.00")).to equal(false)
    expect(LookLike::Support.amount?("53,23 ,1.00")).to equal(false)
  end

  it "should mask date" do
    expect(LookLike::Support.mask_date("12/23/1232")).to eq("xx/xx/xxxx")
  end

  it "should validate date" do
    expect(LookLike::Support.date?("xx/xx/xxxx")).to eq(true)
    expect(LookLike::Support.date?("ONE/TWO/TxREE")).to eq(false)
  end

  it "should validate enums" do
    expect(LookLike::Support.enum?("a/b")).to equal(true)
    expect(LookLike::Support.enum?("a/bcs")).to equal(true)
    expect(LookLike::Support.enum?("a/c/vdsds")).to equal(true)
    expect(LookLike::Support.enum?("/c/vdsds")).to equal(false)
    expect(LookLike::Support.enum?("/c/vdsds/")).to equal(false)
  end

  it "normalize_currency" do
    expect(LookLike::Support.normalize_currency("INRamount")).to eq("$amount")
    expect(LookLike::Support.normalize_currency("INR500,00.00")).to eq("$500,00.00")
    expect(LookLike::Support.normalize_currency("INR 500,00.00")).to eq("$ 500,00.00")
    expect(LookLike::Support.normalize_currency(nil)).to eq("")
    expect(LookLike::Support.normalize_currency("₹23,1.00")).to eq("$23,1.00")
    expect(LookLike::Support.normalize_currency("")).to eq("")
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
