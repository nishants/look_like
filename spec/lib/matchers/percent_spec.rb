require "spec_helper"

describe "amount" do

  it "should support percent values" do
    expect("2%").to look_like("percent")
    expect("40%").to look_like("percent")

    expect("-2%").to look_like("percent")
    expect("-40%").to look_like("percent")

    expect("+2%").to look_like("percent")
    expect("+40%").to look_like("percent")

    expect(".2%").to look_like("percent")
    expect("0.2%").to look_like("percent")
    expect("40.002%").to look_like("percent")

    expect(".009%").to look_like("percent*")
    expect("9.00%").to look_like("percent*")

    expect("-.009%").to look_like("percent*")
    expect("-9.00%").to look_like("percent*")
  end

end
