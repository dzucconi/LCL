# encoding: UTF-8

# Unordered
#
# Executes a set of statements out of sequence.
def unordered(*λ)
  λ.shuffle.each(&:call)

  nil
end
