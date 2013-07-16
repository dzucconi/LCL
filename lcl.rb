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

