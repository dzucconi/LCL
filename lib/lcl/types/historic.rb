class Historic
  attr_reader :__values__

  def initialize(value)
    @__values__ = [].tap do |values|
      values << self.class.wrap(value)
    end
  end

  def method_missing(method, *args, &block)
    self << __recent__.send(method, *args, &block)

    __recent__
  end

  def <<(value)
    __values__ << self.class.wrap(value)

    __recent__
  end

  def values
    __values__.map { |value| value[:value] }
  end

  def __recent__
    values.last
  end
  alias_method :inspect, :__recent__
  alias_method :to_s, :__recent__
  alias_method :value, :__recent__

  def self.wrap(value)
    { value: value, time: Time.now }
  end
end
