TABLE = { 0 => '', 1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV', 5 => 'V', 6 => 'VI', 
            7 => 'VII', 8 => 'VIII', 9 => 'IX', 10 => 'X', 20 => 'XX', 30 => 'XXX',
            40 => 'XL', 50 => 'L', 60 => 'LX', 70 => 'LXX', 80 => 'LXXX', 90 => 'XC',
            100 => 'C', 200 => 'CC', 300 => 'CCC', 400 => 'CD', 500 => 'D', 600 => 'DC',
            700 => 'DCC', 800 => 'DCCC', 900 => 'CM', 1000 => 'M', 2000 => 'MM',
            3000 => 'MMM', 4000 => 'MMMM', 5000 => 'MMMMM' }

class Integer
  def to_roman
    if self < 10
      TABLE[self]
    else 
      convert_num(self)
    end
  end

  def convert_num(num)
    decimal_places = num.to_s.size - 1
    digit_arr = num.to_s.chars.map(&:to_i)
    counter = 0
    
    loop do 
      digit_arr[counter] *= 10 ** decimal_places
      counter += 1
      decimal_places -= 1
      break if decimal_places == 0
    end
    digit_arr
    match_roman_numeral(digit_arr)
  end

  def match_roman_numeral(arr)
    new_str = ''
    arr.each do |el|
      new_str += TABLE[el]
    end
    new_str
  end
end

# Another solution
class Integer
  
  DICTIONARY = {"M" => 1000, "CM" => 900, "D" => 500, "CD" => 400,
                "C" => 100, "XC" => 90, "L" => 50, "XL" => 40,
                "X" => 10, "IX" => 9, "V" => 5, "IV" => 4, "I" => 1}

  def to_roman
    n = self
    result = ''
    DICTIONARY.each do |k, v|
      while n >= v
        result << k
        n -= v
      end
    end
    result
  end
end
