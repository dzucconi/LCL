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
# => poltergeist == string
#   => true
class Poltergeist < Empty
  attr_reader :__delegate__

  def initialize(object)
    @__delegate__ = object
  end

  def method_missing(method, *args, &block)
    __delegate__.send(method, *args, &block)
  end
end
