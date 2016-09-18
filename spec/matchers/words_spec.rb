require "spec_helper"

describe "word matching" do
  it "has a version number" do
    expect(LookLike::VERSION).not_to be nil
  end

  it "single words look similar" do
    expect("Wilma").to look_like("Sam")
    expect("Sam").to look_like("Wilma")
    expect("Vinod").to look_like("Wilma")

    expect("two words").not_to look_like("oneword")
    expect("oneword").not_to look_like("two words")
  end

  it "two words look similar" do
    expect("a cat").to look_like("two words")
  end

  end
