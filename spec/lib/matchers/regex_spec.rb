require "spec_helper"

describe "regex matching" do
  it "should support regex" do
    expect("1-12-1-2").to look_like("/[\\d\\-]+/")
    expect("$3.67").to look_like("/\\$(?<dollars>\\d+)\\.(?<cents>\\d+)/")
    expect("$367").not_to look_like("/\\$(?<dollars>\\d+)\\.(?<cents>\\d+)/")
    expect("i have  test").to look_like("/test/")
    expect("i have  tess").not_to look_like("/test/")
  end

  it "should support substring" do
    expect("One Minute").to look_like("/Minute|Hour|Day/")
    expect("Five Hour").to look_like("/Minute|Hour|Day/")
    expect("Two Day").to look_like("/Minute|Hour|Day/")
    expect("One Day, Five Hours and One Minutes").to look_like("/Minute|Hour|Day/")

    expect("One Week").not_to look_like("/Minute|Hour|Day/")
  end

end
