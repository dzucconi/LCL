# Gorgon
#
# An entity that embodies a process and cannot be killed
class Gorgon
  def initialize(process)
    @process = process

    Thread.new do
      Infinity.new.each { process.call }
    end
  end
end
