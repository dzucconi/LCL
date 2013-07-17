# Full
#
# Contains the complete universe of all information and matter.
#
# Or more specifically: contains all living objects in the Ruby process
# at the time of calling, including itself.
#
# => full = Full.new
# => full.read.include?(full.identity)
#   => true
class Full
  attr_reader :__contents__

  def initialize
    @__contents__ = ObjectSpace.each_object.collect(&:identity) << self
  end

  def read
    __contents__
  end
end
