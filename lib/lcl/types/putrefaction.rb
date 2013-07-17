# Putrefaction
#
# An entity that only produces its data when deleted (garbage collected).
class Putrefaction
  def initialize
    ObjectSpace.define_finalizer(self, self.class.finalize(self))
  end

  def self.finalize(_self)
    proc { STDOUT.write(_self.inspect) }
  end
end
