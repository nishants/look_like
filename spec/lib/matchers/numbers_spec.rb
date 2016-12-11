require "spec_helper"

describe "numbers" do
  it "should support integers and float" do
    expect("5000.00").to look_like("number")
    expect("5000").to look_like("number")
    expect("5,000").to look_like("number")
    expect("5,00.000").to look_like("number")
    expect("5,00.0w00").not_to look_like("number")
    expect("5,43.11").to look_like("number")
    expect("6993").to look_like("5000")
    expect("5000.00").not_to look_like("5000")

    expect("$5000.00").not_to look_like("5000")
    expect("$5000").not_to look_like("5000")
  end
  it "should support integers" do
    expect("0").to look_like("integer")
    expect("1").to look_like("integer")
    expect("5000").to look_like("integer")
    expect("-5000").not_to look_like("integer")
    expect("1.00").not_to look_like("integer")
  end
  it "should support negative integers" do
    expect("-1").to look_like("-integer")
    expect("-10").to look_like("-integer")
    expect("-50000").to look_like("-integer")

    expect("").not_to look_like("-integer")
    expect("5000").not_to look_like("-integer*")
    expect("1.00").not_to look_like("-integer*")
  end

end
