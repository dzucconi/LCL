# Regardless
#
# Ignores all errors in the code block
def regardless(&block)
  yield
rescue
end
