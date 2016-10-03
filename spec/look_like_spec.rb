require "spec_helper"

describe "look_like" do
  it "has a version number" do
    expect(LookLike::VERSION).not_to be nil
  end

  it "every thing looks like itself" do
    expect("Sam").to look_like("Sam")
    expect("1").to look_like("1")
    expect("<:L#$%WRGSDF").to look_like("<:L#$%WRGSDF")
    expect("true").to look_like("true")
  end

  it "nothing looks like a nil" do
    expect(nil).not_to look_like("Sam")
    expect(nil).not_to look_like("1")
    expect(nil).not_to look_like("$500,00")
    expect(nil).not_to look_like("cat climbed wall")
    expect(nil).not_to look_like("<:L#$%WRGSDF")
    expect(nil).not_to look_like("user@mailer.com")
    expect(nil).not_to look_like("http://hello.bolo.com")
    expect(nil).not_to look_like("$amount")
  end

  it "should allow optional fields to be nil" do
    expect(nil).to look_like("Sam*")
    expect(nil).to look_like("1*")
    expect(nil).to look_like("$500,00*")
    expect(nil).to look_like("cat climbed wall*")
    expect(nil).to look_like("<:L#$%WRGSDF*")
    expect(nil).to look_like("user@mailer.com*")
    expect(nil).to look_like("http://hello.bolo.com*")
    expect(nil).to look_like("$amount*")
  end

  it "should allow optional fields to be empty" do
    expect("").to look_like("Sam*")
    expect("").to look_like("1*")
    expect("").to look_like("$500,00*")
    expect("").to look_like("cat climbed wall*")
    expect("").to look_like("<:L#$%WRGSDF*")
    expect("").to look_like("user@mailer.com*")
    expect("").to look_like("http://hello.bolo.com*")
    expect("").to look_like("$amount*")


    expect("  ").to look_like("Sam*")
    expect("  ").to look_like("1*")
    expect("  ").to look_like("$500,00*")
    expect("  ").to look_like("cat climbed wall*")
    expect("  ").to look_like("<:L#$%WRGSDF*")
    expect("  ").to look_like("user@mailer.com*")
    expect(" ").to look_like("http://hello.bolo.com*")
    expect("  ").to look_like("$amount*")
  end

  it "should match strings" do
    expect("Sam").to look_like("string")
    expect("Sam Dam").to look_like("string")
    expect("Some sentence. \n With multiple lines").to look_like("string")
    expect("").not_to look_like("string")
  end

  it "should support amount in dollars" do
    expect("$53,23,1").to look_like("$amount")
    expect("$53,23,1.00").to look_like("$amount")
    expect("$ 53,23,1.00").to look_like("$amount")
    expect("$ 53,23, 1.00").not_to look_like("$amount")
    expect("$53231").to look_like("$amount")
    expect("4232").not_to look_like("$amount")
    expect("4,232").not_to look_like("$amount")
    expect("").not_to look_like("$amount")
    expect(nil).not_to look_like("$amount")
  end

  it "should support all currencies" do
    expect("£53,23,1").to look_like("£amount")
    expect("£53,23,1.00").to look_like("£amount")
    expect("£53,23,1").not_to look_like("$amount")
    expect("$53,23,1").not_to look_like("£amount")
    expect("$53,23,1").not_to look_like("INRamount")
    expect("INR 53,23,1").to look_like("INRamount")
  end

  it "should support formatted number with dollar sign" do
    expect("$53,23,1").to look_like("$5,000")
    expect("53,23,1").not_to look_like("$5,000")
    expect("$53,23,1").not_to look_like("5,000")
  end

  it "should support list of expected values" do
    expect("one").to look_like("one/two/three")
    expect("two").to look_like("one/two/three")
    expect("three").to look_like("one/two/three")

    expect("four").not_to look_like("one/two/three")
  end

end
