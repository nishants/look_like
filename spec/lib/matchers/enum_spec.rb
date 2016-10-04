require "spec_helper"

describe "enum" do
  it "should support list of expected values" do
    expect("one").to look_like("one/two/three*")
    expect("one").to look_like("one/two/three")

    expect("two").to look_like("one/two/three")
    expect("three").to look_like("one/two/three")

    expect("four").not_to look_like("one/two/three")
    expect("four").not_to look_like("one/two/three*")

    expect("").not_to look_like("one/two/three")
    expect("").to look_like("one/two/three*")
    expect(nil).not_to look_like("one/two/three")
    end
end
