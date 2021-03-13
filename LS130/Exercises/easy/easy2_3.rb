# Easy 2 - map

# Using the #each function
def map(arr)
  new_arr = []

  arr.each do |el|
    new_arr << yield(el)
  end
  new_arr
end

# ;Using the #while loop
def map(arr)

  new_arr = []
  counter = 0
  while counter < arr.length
    new_arr << yield(arr[counter])
    counter += 1
  end
  new_arr
end


p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
