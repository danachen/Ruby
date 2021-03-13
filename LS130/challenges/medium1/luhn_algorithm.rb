class Luhn
  attr_reader :input_arr

  def initialize(input)
    @input_arr = input.to_s.chars.map(&:to_i).reverse!
  end

  def addends(*)
    input_arr.map.with_index do |n, idx| 
      idx.odd? ? sum_of_digits(n*2) : n
    end.reverse
  end

  def sum_of_digits(num)
    num % 10 + num / 10
  end

  def checksum(*)
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(input)
    new_test = self.new(input)
    new_test.input_arr.prepend(0)
    arr = new_test.addends
    new_digit = 10 - (new_test.checksum(arr.unshift(0)) % 10)
    if new_digit == 10
      new_digit = 0
    else
      new_digit
    end
    new_test.input_arr.reverse!.delete_at(-1)
    new_test.input_arr.push(new_digit).join.to_i
  end
end

p Luhn.new(8763).addends
p Luhn.new(8763).checksum
p Luhn.new(853).addends
p Luhn.create(123)






