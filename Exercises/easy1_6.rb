# Iterators: True for Any?
# building a method called any? it takes an array, and evaluates the array against the 
# block passsed in, and returns true or false
# it needs to iterate through the array, and return true the first time it comes across 
# a true item


def any?(input)
  if input.class == Array
  input.each do |el|
    return true if yield(el)
  end
  false
  elsif input.class == Hash
    yield(input)
  end
end


# p any?([1, 3, 5, 6]) { |value| value.even? } #== true
# p any?([1, 3, 5, 7]) { |value| value.even? } #== false
# p any?([2, 4, 6, 8]) { |value| value.odd? } #== false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } #== true
# p any?([1, 3, 5, 7]) { |value| true } #== true
# p any?([1, 3, 5, 7]) { |value| false } #== false
# p any?([]) { |value| true } #== false

p any?({:a => 2, :b=> 1}) { |hsh| hsh.values.include?(1)}
p any?({:a => 2, :b=> 1}) { |hsh| hsh.has_key?(:a)}
p any?({:a => 2, :b=> 1}) { |hsh| hsh.has_key?(:c)}