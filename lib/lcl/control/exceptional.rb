# encoding: UTF-8

require File.expand_path(File.dirname(__FILE__) + "/unordered")

# Exceptional
#
# Designates an abnormal flow of program execution
# and guarantees that it will never be handled as an error.
def exceptional(*λ)
  unordered(λ)
rescue
end
