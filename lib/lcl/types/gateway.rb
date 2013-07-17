# Gateway
#
# An associative entity connecting two or more other entities.
class Gateway
  def initialize(a, b)
    [a, b].each do |klass|
      method = "def gate; ObjectSpace._id2ref(#{(klass == a ? b : a).object_id}); end"

      klass.instance_eval do
        eval(method)
      end
    end
  end
end
