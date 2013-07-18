# Infinity
#
# An entity that is unbounded in quality and magnitude.
#
# => Infinity.new.identity.infinite?
#   => -1..1
#
# => Infinity.new.each { puts "Infinite" }
#   => Infinite
#   => Infinite
#   => ...
#
# => Infinity.new == Infinity.new
#   => false
class Infinity
  def identity
    self.class.identity
  end

  def self.identity
    negative..positive
  end

  def self.positive
    +1.0 / 0.0
  end

  def self.negative
    -1.0 / 0.0
  end

  def each
    loop { yield }
  end

  def infinite?
    true
  end
end
