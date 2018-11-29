# Easy 2_10 #each_cons (Part 2)

# def each_cons(arr, elements)

#   arr.each_with_index do |el, idx|
#     if arr[idx + elements - 1] != nil 
#       if elements != 2
#         yield(el, arr[idx + 1 .. idx + elements - 1]) 
#       else
#         yield(el, arr[idx + 1]) 
#       end
#     end
#   end
#   nil
# end
# Problem is yield(el, arr[idx + 1 .. idx + elements - 1]) is an array inside an array

# Official solution

def each_cons(array, n)
  array.each_index do |index|
    yield(*array[index .. (index + n -1)]) if array[index + n -1] != nil
  end
end


hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}