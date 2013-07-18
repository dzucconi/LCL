# Disdain
#
# Ignores all errors in the code block
def disdain(&block)
  yield
rescue
end
