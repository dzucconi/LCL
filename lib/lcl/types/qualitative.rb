# Qualitative
#
# An entity the contents of which are not numerical in value.
class Qualitative
  attr_reader :__contents__

  def initialize(__contents__)
    raise ArgumentError if __contents__.to_f == __contents__

    @__contents__ = __contents__
  end

  def read
    __contents__
  end
end
