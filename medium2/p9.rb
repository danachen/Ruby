# Prob 9: bubble sort

# first write a method that passes through the array once
# then iterate through the array again later

def bubble_sort!(arr)
  n = arr.size - 1
  n.times { n.times { |i| arr[i], arr[i + 1] = arr[i + 1], arr[i] if arr[i] > arr[i + 1] } }
  arr
end

def bubble_sort!(array)

  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end
    break unless swapped
  end
  array
end

# array = [5, 3]
# p bubble_sort!(array)
# array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
# array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)