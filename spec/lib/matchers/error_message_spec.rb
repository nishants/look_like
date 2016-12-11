require "spec_helper"

describe "error messages" do

  it "assertion error message" do
    error    = LookLike::Matchers.error("102", "email")
    expect(error).to eq("'102' does not look like 'email' (email)")
  end

  it "negating assertion error message" do
    error    = LookLike::Matchers.negate_error("a@b.com", "email")
    expect(error).to eq("Did not expect    :'a@b.com' to look like  : 'email' (email)")
  end

  it "negating assertion error message" do
    error    = LookLike::Matchers.negate_error("₹23,1.00", "₹23,1.00")
    expect(error).to eq("Did not expect    :'₹23,1.00' to look like  : '₹23,1.00' (amount)")
  end

end
