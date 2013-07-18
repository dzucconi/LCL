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

  it "should be able to have methods added to it's class definition" do
    @poltergeist.instance_eval { def foo; "bar"; end } # Adds method to String, not Poltergeist
    @poltergeist.foo.should eq("bar")
    @initial.foo.should eq("bar")

    class Poltergeist; def bar; "foo"; end; end
    @_poltergeist = Poltergeist.new(@initial)
    @_poltergeist.bar.should eq("foo")
    expect { @initial.bar }.to raise_error(NoMethodError)
  end
end
