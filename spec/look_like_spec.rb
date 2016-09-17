require "spec_helper"

describe "look_like" do
  it "has a version number" do
    expect(LookLike::VERSION).not_to be nil
  end

  it "every thing looks like itself" do
    expect("Sam").to look_like("Sam")
  end
end
