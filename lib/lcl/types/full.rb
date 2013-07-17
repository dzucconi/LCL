# Full
#
# Contains the complete universe of all information and matter.
#
# Or more specifically: contains all living objects in the Ruby process
# at the time of calling, including itself.
#
# => full = Full.new
# => full.contents.include?(full.identity)
#   => true
class Full
  attr_reader :contents

  def initialize
    @contents = ObjectSpace.each_object.collect(&:identity) << self
  end
end
