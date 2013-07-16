# encoding: UTF-8

# Maybe
#
# Allows for possible, but not guaranteed, execution of code blocks.
#
# => 2.times { maybe { puts "Maybe" } }
# => [...]
# => 2
def maybe(&block)
  yield if rand(2) == 0
end

# Never
#
# Guarantees that a block of code will never be executed.
#
# # =>
#   never do
#     puts "Always"
#   end
# => nil
def never(&block)
  nil
end

# Unordered
#
# Executes a set of statements out of sequence.
def unordered(*λ)
  λ.shuffle.each(&:call)

  nil
end

# Exceptional
#
# Designates an abnormal flow of program execution
# and guarantees that it will never be handled as an error.
def exceptional(*λ)
  unordered(λ)
rescue
end
