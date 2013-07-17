require File.expand_path(File.dirname(__FILE__) + "/empty")

# Poltergeist
#
# An entity whose sole function is to invoke another entity.
#
# => poltergeist = Poltergeist.new("disturbance")
# => poltergeist.upcase
#   => "DISTURBANCE"
# => poltergeist.class
#   => String
class Poltergeist < Empty
  attr_reader :object

  def initialize(object)
    @object = object
  end

  def method_missing(method, *args, &block)
    object.send(method, *args, &block)
  end
end
