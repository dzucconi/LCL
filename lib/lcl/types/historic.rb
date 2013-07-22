class Historic
  attr_reader :values

  def initialize(value)
    @values = [].tap do |values|
      values << self.class.wrap(value)
    end
  end

  def method_missing(method, *args, &block)
    args.each do |arg|
      self << __recent__.send(method, arg, &block)
    end

    __recent__
  end

  def <<(value)
    values << self.class.wrap(value)

    __recent__
  end

  def __values__
    values.map { |value| value[:value] }
  end

  def __recent__
    __values__.last
  end
  alias_method :inspect, :__recent__
  alias_method :to_s, :__recent__

  def self.wrap(value)
    { value: value, time: Time.now }
  end
end
