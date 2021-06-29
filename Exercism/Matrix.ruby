class Matrix
  attr_reader :rows

  def initialize(str)
    @rows = str.lines.map { |el| el.split.map(&:to_i)}
  end

  def columns
    rows.transpose
  end
end