# Gateway
#
# An associative entity connecting two or more other entities.
class Gateway
  def initialize(a, b)
    set = [a, b]

    set.each do |klass|
      id = (klass == a ? b : a).object_id

      ObjectSpace._id2ref(id)

      str = "def gate; ObjectSpace._id2ref(#{id}); end"

      klass.instance_eval do
        eval(str)
      end
    end
  end
end
