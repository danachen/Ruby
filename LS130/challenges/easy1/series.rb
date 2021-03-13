class Series
  attr_reader :str
  
  def initialize(str)
    @str = str
  end

  def slices(num)
    raise ArgumentError, 'outside of range.' if num > str.size
    new_arr = []
    str.chars.each_with_index do |n, idx|
      current_upper_range = idx + num - 1
      new_arr << str[idx..current_upper_range].chars.map(&:to_i) if current_upper_range < str.size
    end
  new_arr
  end
end

# Solution refactored with an easier range option
class Series
  attr_reader :str
  
  def initialize(str)
    @str = str.each_char.map(&:to_i)
  end

  def slices(num)
    raise ArgumentError, 'outside of range.' if num > str.size
    (0..@str.size-num).map { |idx| @str[idx, num]}
  end
end


# Solving with each_cons
class Series
  attr_reader :str

  def initialize(str)
    @str = str.each_char.map(&:to_i)
  end

  def slices(num)
    raise ArgumentError, 'Slices is bigger than number size' if num > str.size
    @str.each_cons(num).to_a
  end
end

# Test
series = Series.new('92834')
p series.slices(4)
