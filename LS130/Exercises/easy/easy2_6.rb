# Easy, #select method

# with iterator
def each_with_index(arr)
  arr.each do |el|
    yield(el, arr.find_index(el))
  end
end

# without iterator
def each_with_index(arr)
  counter = 0
  arr.each do |el|
    yield(el, counter)
    counter += 1
  end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

# 0 -> 1
# 1 -> 3
# 2 -> 36
# true