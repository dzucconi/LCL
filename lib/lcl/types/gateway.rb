# Gateway
#
# An associative entity connecting two or more other entities.
#
# => a = "first"
# => b = "second"
# => Gateway.new(a, b)
# => a.gate
#   => "second"
# => b.gate
#   => "first"
# => a.gate.gate == a
#   => true
# => a.gate.gate.gate == b
#   => true
#
# => rand(100).times.collect { "gate" }.inject(a, &:send)
#   => "first" || "second"
class Gateway
  def initialize(a, b)
    [a, b].each do |klass|
      method = <<-eos
        def gate
          ObjectSpace._id2ref(#{(klass == a ? b : a).object_id})
        end
      eos

      klass.instance_eval do
        eval(method)
      end
    end
  end
end
