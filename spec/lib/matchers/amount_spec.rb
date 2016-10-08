require "spec_helper"

describe "amount" do

  it "should support amount in dollars" do
    expect("$53,23,1").to look_like("$amount*")
    expect("$53,23,1").to look_like("$amount")
    expect("₹23,1.00").to look_like("₹amount")

    expect("$53,23,1.00").to look_like("$amount")
    expect("$ 53,23,1.00").to look_like("$amount")

    expect("$53231").to look_like("$amount")

    expect("$ 53,23, 1.00").not_to look_like("$amount")
    expect("4232").not_to look_like("$amount*")

    expect("4232").not_to look_like("$amount")
    expect("4,232").not_to look_like("$amount")
    expect("").not_to look_like("$amount")
    expect(nil).not_to look_like("$amount")
  end

  it "should support all currencies" do
    expect("£53,23,1").to look_like("£amount*")
    expect("£53,23,1").to look_like("£amount")
    expect("£53,23,1.00").to look_like("£amount")

    expect("£53,23,1").not_to look_like("$amount")
    expect("£53,23,1").not_to look_like("$amount*")

    expect("$53,23,1").not_to look_like("£amount")

    expect("£53,23,1").to look_like("£53,23,1")
    expect("£53,23,1").not_to look_like("$53,23,1")
    expect("$53,23,1").not_to look_like("£53,23,1")

    expect("$53,23,1").not_to look_like("INRamount")
    expect("INR 53,23,1").to look_like("INRamount")
  end

  it "should support formatted number with dollar sign" do
    expect("$53,23,1").to look_like("$5,000*")
    expect("$53,23,1").to look_like("$5,000")
    expect("53,23,1").not_to look_like("$5,000")
    expect("$53,23,1").not_to look_like("5,000")
  end

end
