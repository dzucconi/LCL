require File.expand_path(File.dirname(__FILE__) + "/empty")

# Incontinent
#
# An entity that involuntarily expresses itself as any other data type.
#
# => Incontinent.new.class
#   => Time
# => Incontinent.new.class
#   => Float
# => Incontinent.new.class
#   => Array
# => Incontinent.new.class
#   => Regexp
class Incontinent < Empty
  attr_reader :__delegate__

  def initialize
    @__delegate__ = ObjectSpace.each_object.collect(&:identity).sample
  end

  def method_missing(method, *args, &block)
    __delegate__.send(method, *args, &block)
  end
end
