require "spec_helper"

describe "numbers" do
  it "should support integers and float" do
    expect("6993").to look_like("5000")
    expect("5000.00").not_to look_like("5000")

    expect("$5000.00").not_to look_like("5000")
    expect("$5000").not_to look_like("5000")
  end

end
