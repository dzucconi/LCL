class Object
  def identity
    self
  end
end

class Range
  def infinite?
    return (-1..1) if self.first.to_f.infinite? && self.last.to_f.infinite?

    self.first.to_f.infinite? || self.last.to_f.infinite?
  end
end

# Empty
#
# A null entity lacking any and all material or immaterial distinction.
# The empty type allows for dynamic creation of new, unimagined types at runtime.
class Empty
  instance_methods.each do |method|
    undef_method(method)
  end
end

# Creature
#
# An entity that is not readable, writable, or executable but that exists.
class Creature < Empty
end; Creature.freeze

# Poltergeist
#
# An entity whose sole function is to invoke another entity.
#
# => Poltergeist.new("disturbance").upcase
#   => "DISTURBANCE"
class Poltergeist < Empty
  attr_reader :object

  def initialize(object)
    @object = object
  end

  def method_missing(method, *args, &block)
    object.send(method, *args, &block)
  end
end

# Full
#
# Contains all living objects in the Ruby process
# at the time of calling, including itself
class Full
  attr_reader :self, :contents

  def initialize
    @self = self
    @contents = ObjectSpace.each_object.collect(&:identity) << self
  end
end

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
end

# Qualitative
#
# An entity the contents of which are not numerical in value.
class Qualitative
  attr_reader :contents

  def initialize(contents)
    raise ArgumentError if contents.to_f == contents

    @contents = contents
  end
end

# Incontinent
#
# An entity that involuntary (todo) expresses itself as any other data type.
#
# => Incontinent.new.class
#   => Process::Status
# => Incontinent.new.class
#   => Float
# => Incontinent.new.class
#   => RubyToken::TkIDENTIFIER
# => Incontinent.new.class
#   => Array
# => Incontinent.new.class
#   => Regexp
class Incontinent
  attr_reader :class

  def initialize
    @class = Full.new.contents.collect(&:class).uniq.sample
  end
end
