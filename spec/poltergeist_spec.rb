require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

describe "Poltergeist" do
  before do
    @initial = "disturbance"
    @poltergeist = Poltergeist.new(@initial)
  end

  it "should have the same methods as initial" do
    @poltergeist.methods.should eq(@initial.methods)
  end

  it "should have the same result when corresponding methods are called" do
    @poltergeist.upcase.should eq(@initial.upcase)
  end

  it "should have the same object_id" do
    @poltergeist.object_id.should eq(@initial.object_id)
  end

  it "should be identitcal to the initial" do
    @poltergeist.should eq(@initial)
  end
end
