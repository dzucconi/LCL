# Flaw
#
# A fault or imperfection associated with another entity.
#
# Implements an intialize method such that when included in a class,
# every time an instance of that class is created there is a 50/50 chance
# that each instance method will be undefined.
module Flaw
  def initialize
    singleton = class << self; self; end

    self.instance_eval do
      singleton.instance_methods.each do |method|
        maybe do
          singleton.send(:undef_method, method)
        end
      end
    end
  end
end
