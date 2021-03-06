require File.expand_path('../../../spec_helper', __FILE__)

# The String#splice! method is a helper method. Because of the semantics of
# Ruby methods that use this method, bounds checking and data conversions need
# to happen before this method is called. Hence, to improve the performance of
# this method, its API expects valid in-range values and its behavior is
# UNDEFINED for values out-of-range. The underlying primitive that manipulates
# vectors of bytes is boundary safe (as all such primitives must be).

describe "String#splice!" do
  it "replaces zero characters an the beginning of the String" do
    "abc".splice!(0, 0, "").should == "abc"
  end

  it "replaces zero characters within the String" do
    "abc".splice!(1, 0, "").should == "abc"
  end

  it "replaces zero characters at the end of the String" do
    "abc".splice!(3, 0, "").should == "abc"
  end

  it "replaces characters at the beginning of the String" do
    "abc".splice!(0, 2, "xyz").should == "xyzc"
  end

  it "replaces characters within the String" do
    "abcde".splice!(1, 2, "xyz").should == "axyzde"
  end

  it "replaces characters at the end of the String" do
    "abc".splice!(2, 1, "xyz").should == "abxyz"
  end

  it "inserts characters an the beginning of the String" do
    "abc".splice!(0, 0, "x").should == "xabc"
  end

  it "inserts characters within the String" do
    "abc".splice!(1, 0, "x").should == "axbc"
  end

  it "inserts characters at the end of the String" do
    "abc".splice!(3, 0, "x").should == "abcx"
  end

  it "inserts characters after the end of the String" do
    "abc".splice!(3, 0, "xyz").should == "abcxyz"
  end

  it "removes characters at the beginning of the String" do
    "abc".splice!(0, 1, "").should == "bc"
  end

  it "removes characters within the String" do
    "abcde".splice!(2, 2, "").should == "abe"
  end

  it "removes characters at the end of the String" do
    "abcde".splice!(3, 2, "").should == "abc"
  end
end
