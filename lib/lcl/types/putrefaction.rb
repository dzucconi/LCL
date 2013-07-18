# Putrefaction
#
# An entity that only produces its data when deleted (garbage collected).
#
# => putrefaction = Putrefaction.new("information")
#   => (Object doesn't support #inspect)
#   =>
# => exit
#   => #<Putrefaction:0x007fb7531a13e8 @__object__="information">
class Putrefaction
  def initialize(object)
    @__object__ = object

    ObjectSpace.define_finalizer(self, self.class.finalize(self))
  end

  def self.finalize(_self)
    proc { STDOUT.write(_self.send(:inspect)) }
  end

  private :inspect
end
