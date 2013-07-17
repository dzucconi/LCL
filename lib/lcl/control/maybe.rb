# Maybe
#
# Allows for possible, but not guaranteed, execution of code blocks.
#
# => 2.times { maybe { puts "Maybe" } }
#   => [...]
#   => 2
def maybe(&block)
  yield if rand(2) == 0
end
