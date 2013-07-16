# Creature
#
# An entity that is not readable, writable, or executable but that exists.
class Creature
  instance_methods.each { |method| undef_method(method) }
end
