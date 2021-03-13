class Octal
  OCTAL = 8
  INVALID = /[^0-7]/
  
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def to_decimal
    return 0 if num.match(INVALID)
    num.chars.map(&:to_i).reverse.each.with_index.reduce(0) { |memo, (n, i)| memo += n*(OCTAL**i) }
  end
end

# Another solution
class Octal
  def initialize(num)
    @num = num.match?(/[^0-7]/) ? '0' : num
  end

  def to_decimal
    @num.chars.reduce(0) { |sum, n| n.to_i + sum * 8 }
  end
end


# Decimal to octal
class Octal
  
  OCTAL = 8
  INVALID = /[^0-7]/
  
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def to_decimal
    return 0 if num.match(INVALID)
    new_arr = []
    num_new = num.to_i
    loop do 
      break if num_new <= 0
        new_arr << num_new % OCTAL 
        num_new /= OCTAL
      end
      new_arr.reverse.join
  end
end

p Octal.new('azc89').to_decimal
p Octal.new('6789').to_decimal
p Octal.new('abc1z').to_decimal

p Octal.new('342391').to_decimal #4095
p Octal.new('1234567').to_decimal #342_391
p Octal.new('130').to_decimal #88
