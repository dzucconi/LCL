# encoding: UTF-8

class Fixnum
  def to_boolean
    self == 0 ? false : true
  end
end

# Maybe
#
# Allows for possible, but not guaranteed, execution of code blocks.
def maybe(&block)
  yield if rand(2).to_boolean
end

# Never
#
# Guarantees that a block of code will never be executed.
def never(&block)
  nil
end

# Unordered
#
# Executes a set of statements out of sequence.
def unordered(*λs)
  λs.shuffle.each(&:call)

  nil
end

# Exceptional
#
# Designates an abnormal flow of program execution
# and guarantees that it will never be handled as an error.
def exceptional(*λs)
  unordered(λs)
rescue
end
