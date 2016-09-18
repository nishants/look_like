require "spec_helper"

describe "reged matching" do
  it "should support regex" do
    expect("i have  test").to look_like("/test/")
  end

end
