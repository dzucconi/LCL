# encoding: UTF-8

# Unordered
#
# Executes a set of statements out of sequence.
#
# # =>
#   unordered(*("a".."z").collect.with_index do |_, i|
#     -> { STDOUT.write("#{_}#{i}") }
#   end)
#   => w22s18e4n13g6q16t19b1c2h7j9x23y24v21p15o14d3a0l11m12z25k10i8f5r17u20
#
# # =>
#   x = 0
#   unordered(*[
#     -> { x = 1 },
#     -> { x = 2 },
#     -> { x = 3 }
#   ])
#   x
#   => 1 || 2 || 3
def unordered(*λ)
  λ.shuffle.each(&:call)
end
