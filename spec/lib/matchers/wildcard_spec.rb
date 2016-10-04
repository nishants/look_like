require "spec_helper"

describe "wildcard : represents nil or empty spaces or optional" do

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
    expect("").to look_like("email*")
    expect("").to look_like("one/two/three*")

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
    expect("Sam").to look_like("string*")
    expect("Sam").to look_like("string")

    expect("Sam Dam").to look_like("string")
    expect("Some sentence. \n With multiple lines").to look_like("string")
    expect("").not_to look_like("string")
  end

  it "should support wildcard : *" do
    expect("").to look_like("*")
    expect(nil).to look_like("*")
    expect("one.abs\absd@two.com").to look_like("*")
  end

end
