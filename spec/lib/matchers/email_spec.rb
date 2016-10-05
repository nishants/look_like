require "spec_helper"

describe "email" do
  it "should support email" do
    expect("one@two.xyz").to look_like("email*")
    expect("one.two.xyz").not_to look_like("email*")
    expect("one@two.xyz").to look_like("email")

    expect("one@two.xyz").to look_like("one@two.xyz")

    expect("one.abs/absd@two.com").not_to look_like("email")
    expect("one.abs\absd@two.com").not_to look_like("one@two.xyz")

    expect("one.abs/absd@two.com").not_to look_like("email*")
    expect("one.abs\absd@two.com").not_to look_like("one@two.xyz*")

    expect("abc.xyz").not_to look_like("email")
    expect("abc.xyz").not_to look_like("email*")
    expect("abc.xyz").not_to look_like("one@two.xyz*")

    expect("hello").not_to look_like("email")
    expect("").not_to look_like("email")
  end
end
