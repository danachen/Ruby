class Squares
  attr_reader :arr_range

  def initialize(limit)
    @arr_range = (0..limit)
  end

  def difference
    square_of_sum - sum_of_squares
  end

  def square_of_sum
    arr_range.sum.abs2
  end

  def sum_of_squares
    arr_range.sum(&:abs2)
  end
end