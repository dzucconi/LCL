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
