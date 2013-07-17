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
  attr_reader :delegate

  def initialize
    @delegate = ObjectSpace.each_object.collect(&:identity).sample
  end

  def method_missing(method, *args, &block)
    delegate.send(method, *args, &block)
  end
end
