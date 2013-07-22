# Gorgon
#
# An entity that embodies a process and cannot be killed
class Gorgon
  def initialize(process)
    loop { fork { process.call } }
  end
end
