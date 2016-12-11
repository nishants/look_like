require "spec_helper"

describe "arrays" do
  it "should support matchers for arrays" do
    expect(["one@two.xyz", "a@b.com", "₹300,20", "http://google.com", "", "yes","" , ""]).to look_like(["email*", "email", "₹amount", "url", "$amount*", "yes/no","*", ""])
    expect(["one@two.xyz", "a@b.com", "₹300,20", "http://google.com", "", ""]).not_to look_like(["email*", "email", "₹amount", "url", "$amount*", "*", ""])
  end

  it "should support matchers for arrays of arrays" do
    rows     = [ ["one@two.xyz",    "₹300,20", "yes"],
                 ["two@three.com",  "₹301,20", "no" ],
                 ["one@two.xyz",    "₹121,20", ""   ]]

    matchers = [["email", "₹amount", "yes/no*"]]

    expect(rows).to look_like(matchers)
  end

  it "assertion error message for arrays" do
    actual    = ["one@two.xyz",    "₹300,20", ""]
    expected  = ["email", "₹amount", "yes/no"]

    error    = LookLike::Matchers.error(actual, expected)
    expect(error).to eq("[✓, ✓, X {'' does not look like 'yes/no' (enum)}]")
  end

  it "negating assertion error message for arrays" do
    actual    = ["one@two.xyz",    "₹300,20", ""]
    expected  = ["email", "₹amount", "yes/no"]

    error    = LookLike::Matchers.negate_error(actual, expected)
    expect(error).to eq("Expected not to match.[✓, ✓, X {'' does not look like 'yes/no' (enum)}]")
  end

  it "assertion error message for nested arrays" do
    actual    = [["one@two.xyz",    "₹300,20", ""]]
    expected  = [["email", "₹amount", "yes/no"]]

    error    = LookLike::Matchers.error(actual, expected)
    expect(error).to eq("[X [[✓, ✓, X {'' does not look like 'yes/no' (enum)}]]]")
  end

  it "negating assertion error message for nested arrays" do
    actual    = [["one@two.xyz",    "₹300,20", ""]]
    expected  = [["email", "₹amount", "yes/no"]]

    error    = LookLike::Matchers.negate_error(actual, expected)
    expect(error).to eq("Expected not to match.[X [[✓, ✓, X {'' does not look like 'yes/no' (enum)}]]]")
  end

  it "assertion error message for arrays length" do
    actual    = [["one@two.xyz",    "₹300,20"]]
    expected  = [["email", "₹amount", "yes/no*"]]

    error    = LookLike::Matchers.error(actual, expected)
    expect(error).to eq("[X [Expected 3 elements, but found 2.. Expected : [email, ₹amount, yes/no*]. Found    : [one@two.xyz, ₹300,20]]]")
  end

end
