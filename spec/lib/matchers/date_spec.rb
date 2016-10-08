require "spec_helper"

describe "amount" do

  it "should support all date formates" do
    expect("12/13/2014").to look_like("DD/MM/YYYY")
    expect("12/13/2014").not_to look_like("DD/MM/YY")
  end

end
