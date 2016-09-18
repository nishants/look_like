require "spec_helper"

describe "amount" do
  it "should support formatted number with dollar sign" do
    expect("$53,23,1").to look_like("$5,000")
    expect("53,23,1").not_to look_like("$5,000")
    # expect("$53,23,1").not_to look_like("5,000")
  end

end
