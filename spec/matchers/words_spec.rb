require "spec_helper"

describe "word matching" do
  it "has a version number" do
    expect(LookLike::VERSION).not_to be nil
  end

  it "single words look similar" do
    expect("").not_to look_like("Sam")
    expect("").to look_like("")
    expect(" ").not_to look_like("a b")
    expect(" Wilma ").to look_like("Sam")
    expect("Wilma").to look_like(" Sam ")
    expect("Wilma").to look_like("Sam")

    expect("two words").not_to look_like("oneword")
    expect("oneword").not_to look_like("two words")
  end

  it "two words look similar" do
    expect("a cat").to look_like("two words")
    expect("a cat").not_to look_like("a three words")
    expect("a three words").not_to look_like("a cat")
  end

  it "three words look similar" do
    expect("a white cat").to look_like("a three words")

    expect("a three words").not_to look_like("cat")
    expect("a three words").not_to look_like("a cat")
    expect("a white cat").not_to look_like("a four word sentence")
  end

  end
