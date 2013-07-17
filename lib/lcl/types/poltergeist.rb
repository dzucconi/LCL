require File.expand_path(File.dirname(__FILE__) + "/empty")

# Poltergeist
#
# An entity whose sole function is to invoke another entity.
#
# => string = "disturbance"
# => poltergeist = Poltergeist.new(string)
# => poltergeist.upcase
#   => "DISTURBANCE"
# => poltergeist.class
#   => String
# => poltergeist.object_id == string.object_id
#   => true
class Poltergeist < Empty
  attr_reader :object

  def initialize(object)
    @object = object
  end

  def method_missing(method, *args, &block)
    object.send(method, *args, &block)
  end
end
