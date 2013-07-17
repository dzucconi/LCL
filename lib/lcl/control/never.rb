# Never
#
# Guarantees that a block of code will never be executed.
#
# # =>
#   never do
#     puts "Always"
#   end
#   => nil
def never(&block)
  nil
end
