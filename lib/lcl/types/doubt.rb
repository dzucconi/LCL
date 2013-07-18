# Doubt
#
# An entity that questions its own status as an entity,
# which it may or may not actually be (see also Denial and Refusal).
class Doubt
  def class
    maybe { nil }
    maybe { super }
  end
end
