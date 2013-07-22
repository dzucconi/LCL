require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

describe "Historic" do
  before do
    @historic = Historic.new(1)
  end

  it "should mutate it's value in place" do
    @historic + 1
    @historic.value.should eq(2)

    @historic + 2
    @historic.value.should eq(4)
  end
end
