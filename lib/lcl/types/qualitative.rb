# Qualitative
#
# An entity the contents of which are not numerical in value.
class Qualitative
  attr_reader :contents

  def initialize(contents)
    raise ArgumentError if contents.to_f == contents

    @contents = contents
  end
end
