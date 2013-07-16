class Object
  def identity
    self
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
# => poltergiest = Poltergeist.new("disturbance")
# => poltergiest.upcase
# => "DISTURBANCE"
class Poltergeist
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
# Contains all living, nonimmediate objects in the Ruby process
# at the time of calling
class Full
  attr_reader :contents

  def initialize
    @contents = ObjectSpace.each_object.collect(&:identity)
  end
end

# Infinity
#
# An entity that is unbounded in quality and magnitude.
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
