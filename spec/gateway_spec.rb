require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

describe "Gateway" do
  before do
    @a = "first"
    @b = "second"
    @gateway = Gateway.new(@a, @b)
  end

  it "should have a gate on A that leads to B" do
    @a.gate.should eq(@b)
  end

  it "should have a gate on B that leads to A" do
    @b.gate.should eq(@a)
  end

  it "should have a gate on A that leads to B that has a gate that leads to A" do
    @a.gate.gate.should eq(@a)
  end

  it "should be able to be chained indefinitely" do
    [@a, @b].should include(rand(100).times.collect { "gate" }.inject(@a, &:send))
  end
end
