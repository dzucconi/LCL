# Potential
#
# Evaluates an entity only according to as yet unrealized possibility.
def potential(&block)
  sleep(rand(MAX_SIGNED))

  yield
end
