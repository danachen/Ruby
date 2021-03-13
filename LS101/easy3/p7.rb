# Prob 7: Odd Lists

def oddities(arr)

  counter = 0
  new_arr = []

  loop do
    if counter % 2 == 0
      new_arr << arr[counter]
    end
    counter += 1
    break if counter == arr.length
  end
  new_arr
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities(['abc', 'def']) == ['abc']
# oddities([123]) == [123]
# oddities([]) == []

# Two additional ways
def oddities(arr)
  new_arr = []
  arr.each.with_index do |item, idx|
    new_arr << item if idx == 0 || idx.even?
  end
  new_arr
end

def oddities(arr)
  arr.select.with_index do |element, idx|
    idx.even? || idx == 0
  end
end