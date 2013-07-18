# Flip
#
# An entity that oscillates between two other data types.
class Flip
  attr_reader :__a__, :__b__
  attr_accessor :__counter__
  private :__a__, :__b__, :__counter__

  def initialize(a, b)
    @__a__ = a
    @__b__ = b
    @__counter__ = -1
  end

  def method_missing(method, *args, &block)
    __delegate__.send(method, *args, &block)
  end

  def __delegate__
    @__counter__ += 1

    @__counter__ % 2 == 0 ? __a__ : __b__
  end
end
