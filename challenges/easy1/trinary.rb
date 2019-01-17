class Trinary
  TRI = 3
  INVALID = /[^0-2]/
  
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def to_decimal
    return 0 if num.match(INVALID)
    num.chars.map(&:to_i).reverse.each.with_index.reduce(0) { |memo, (n, i)| memo += n*(TRI**i) }
  end
end

# Additional solution
class Trinary
  def initialize(num)
    @num = num.match?(/[^012]/) ? '0' : num
  end

  def to_decimal
    @num.chars.reduce(0) { |sum, n| n.to_i + sum * 3 }
  end
end

# Hex:
class Hex
  HEX_TO_DECIMAL = [*'0'..'9', *'A'..'F'].freeze

  def initialize(num)
    @num = num.match?(/[^0-9a-f]/i) ? '0' : num.upcase
  end

  def to_decimal
    @num.chars.reduce(0) { |sum, n| HEX_TO_DECIMAL.index(n) + sum * 16 }
  end
end

# With #digits
class Trinary
  BASE = 3
  INVALID = /[^0-2]/

  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    return 0 if @trinary.match(INVALID)
    @trinary.to_i.digits.map.with_index { |val, idx| val * BASE**idx }.sum
  end
end