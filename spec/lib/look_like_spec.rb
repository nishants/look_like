require "spec_helper"

describe "look_like" do
  it "has a version number" do
    expect(LookLike::VERSION).not_to be nil
  end

  it "every thing looks like itself" do
    expect("Sam").to look_like("Sam")
    # expect("Sam").to look_like("Sam*")
    expect("1").to look_like("1")
    expect("<:L#$%WRGSDF").to look_like("<:L#$%WRGSDF")
    expect("true").to look_like("true")
  end

  it "nothing looks like a nil or empty" do
    expect(nil).not_to look_like("Sam")
    expect(nil).not_to look_like("1")
    expect(nil).not_to look_like("$500,00")
    expect(nil).not_to look_like("cat climbed wall")
    expect(nil).not_to look_like("<:L#$%WRGSDF")
    expect(nil).not_to look_like("user@mailer.com")
    expect(nil).not_to look_like("http://hello.bolo.com")
    expect(nil).not_to look_like("$amount")

    expect("").not_to look_like("Sam")
    expect("").not_to look_like("1")
    expect("").not_to look_like("$500,00")
    expect("").not_to look_like("cat climbed wall")
    expect("").not_to look_like("<:L#$%WRGSDF")
    expect("").not_to look_like("user@mailer.com")
    expect("").not_to look_like("http://hello.bolo.com")
    expect("").not_to look_like("$amount")
  end

  it "should support matchers for array of arrays" do
    rows     = [ ["one@two.xyz",    "₹300,20", "yes"],
                 ["two@three.com",  "₹301,20", "no" ],
                 ["one@two.xyz",    "₹121,20", ""   ]]

    matchers = [["email", "₹amount", "yes/no*"]]

    expect(rows).to look_like(matchers)
  end

end
