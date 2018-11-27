# Prob 9: Multiply All Pairs

# each number between the two arrays are multiplied, and the results are sorted
# sorting is easy
# how to multiply each one
# two-layer array


def multiply_all_pairs(arr1, arr2)

  new_arr = []

  arr1.each do |first|
    arr2.each do |second|
      new_arr << first * second
    end
  end
  new_arr.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) #== [2, 4, 4, 6, 8, 8, 12, 16]

