class Range
  def infinite?
    return (-1..1) if self.first.to_f.infinite? && self.last.to_f.infinite?

    self.first.to_f.infinite? || self.last.to_f.infinite?
  end
end
