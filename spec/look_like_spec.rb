require "spec_helper"

describe "look_like" do
  it "has a version number" do
    expect(LookLike::VERSION).not_to be nil
  end

  it "single words are similar" do
    expect("Sam").to look_like("Wilma")
  end
end
