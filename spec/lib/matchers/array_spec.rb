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

end
