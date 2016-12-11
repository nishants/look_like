require "spec_helper"

describe "amount" do

  it "should support text matcher" do
    expect("Some text").to look_like("text")
    expect("A paragraph with a few words.").to look_like("text")

    expect("A paragraph with a few words.").to look_like("text*")
    expect("").to look_like("text*")
    expect("").not_to look_like("text")
  end

  it "should support name matcher" do
    expect("some name").to look_like("name")

    expect("some larger name with multiple words").to look_like("name*")
    expect("").to look_like("name*")
    expect("").not_to look_like("name")
  end

end
