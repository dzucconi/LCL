# Flaw
#
# A fault or imperfection associated with another entity.
module Flaw
  def initialize
    singleton = class << self; self end

    self.instance_eval do
      singleton.instance_methods.each do |method|
        maybe do
          singleton.send(:undef_method, method)
        end
      end
    end
  end
end
