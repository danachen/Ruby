class Series
  attr_reader :num_arr

  def initialize(num)
    @num_arr = num.chars
  end

  def slices(n)
    raise ArgumentError if n > num_arr.size
    num_arr.each_cons(n).map(&:join)
  end
end