require "spec_helper"

describe "amount" do

  it "does not validate date range" do
    expect("99/99/2014").to look_like("DD/MM/YYYY")
    expect("99/99/-2014").not_to look_like("DD/MM/YYYY")
  end

  it "should support all date formates" do
    expect("12/13/2014").to look_like("date")
    expect("12/32/a").not_to look_like("date")
    expect("//").not_to look_like("date")

    expect("12/13/2014").to look_like("DD/MM/YYYY")
    expect("12-13-2014").to look_like("DD-MM-YYYY")

    expect("12/13/2014").not_to look_like("DD/MM/YY")
    expect("12/13/14").to look_like("DD/MM/YY")
    expect("12/13/14").to look_like("11/14/98")
    expect("12/13/14").not_to look_like("11/14/1998")
    expect("99/99/-2014").not_to look_like("DD/MM/YYYY")
  end

  it "should support all time formates" do
    expect("1994-11-05T08:15:30-05:00").to look_like("timestamp")
    expect("2014-12-31 T 11:59:13").to look_like("YYYY-MM-DD T HH:MM:SS")
    expect("2014-12-31 T 11:59:13").to look_like("YYYY-MM-DD T hh:mm:ss")

    expect("2014-12-31 Z 11:59:13").not_to look_like("YYYY-MM-DD T hh:mm:ss")
    expect("//").not_to look_like("YYYY-MM-DD T hh:mm:ss")

    expect("2014-12-31 T 11:59:13").not_to look_like("YYYY-MM-DD Z HH:MM:SS")

    expect("").not_to look_like("YYYY-MM-DD Z HH:MM:SS")
    expect("").to look_like("YYYY-MM-DD Z HH:MM:SS*")

    expect("1994-11-05aT08:15:30-05:00").not_to look_like("timestamp")
    expect("1994-11-05aT08:15:30-05:00").not_to look_like("timestamp*")
    expect("abs").not_to look_like("timestamp")

    expect("1994-11-05T08:15:30-05:00").to look_like("1994-11-05T08:15:30-05:00")
    expect("1994-11-05T08:15:30-05:00").not_to look_like("1994/11/05T08:15:30-05:00")
    expect("1994-11-05T08:15:30-05:00").not_to look_like("1994-11-05Z08:15:30-05:00")
  end

end
