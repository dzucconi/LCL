# Qualitative
#
# An entity the contents of which are not numerical in value.
class Qualitative
  attr_reader :__contents__

  def initialize(object)
    raise ArgumentError if object.to_f == object

    @__contents__ = object
  end

  def read
    __contents__
  end
end
