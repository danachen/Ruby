# Easy 2_7 #each_with_object

def each_with_object(obj1, obj2)
  obj1.each do |el| 
    yield(el, obj2)
  end
  obj2
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end

p result
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p 