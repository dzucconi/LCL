# Empty
#
# A null entity lacking any and all material or immaterial distinction.
# The empty type allows for dynamic creation of new, unimagined types at runtime.
#
# => Empty.new
#   => (Object doesn't support #inspect)
#   =>
class Empty
  instance_methods.each do |method|
    undef_method(method)
  end
end
