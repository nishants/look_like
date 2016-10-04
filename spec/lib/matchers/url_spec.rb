require "spec_helper"

describe "url" do
  it "value with http/https" do
    expect("http://google.com").to look_like("http://google.com")
    expect("https://google.com").to look_like("http://google.com")

    expect("http://google.com").to look_like("https://google.com")
    expect("https://google.com").to look_like("https://google.com")
  end

  it "value without http/https" do
    expect("google.com").to look_like("http://google.com")
    expect("google.com/services?has=9239&b=22").to look_like("http://google.com")

    expect("google-com").not_to look_like("http://google.com")
    expect("googlecom").not_to look_like("http://google.com")
    expect("google com").not_to look_like("http://google.com")
    expect("google com").not_to look_like("http://google.com")
  end

  it "nil and empty values" do
    expect(nil).not_to look_like("http://google.com")
    expect("").not_to look_like("http://google.com")
    expect(" ").not_to look_like("http://google.com")
  end

end
