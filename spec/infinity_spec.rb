require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

describe "Infinity" do
  before do
    @infinity = Infinity.new
  end

  it "should be infinite" do
    @infinity.infinite?.should eq(true)
  end

  it "should have an infinite identity range" do
    @infinity.identity.infinite?.should eq(-1..1)
  end
end
