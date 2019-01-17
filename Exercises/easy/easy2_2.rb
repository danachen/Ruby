# Zipper

# input: two sets of arrays of the same length
# output: 2 dimentional array, where one from each index is taken and placed with the other
# index 0 of arr 1 and arr 2 are combined to form a new array, index 1 of arr1 and arr2 are combined
# to form a new array, etc etc


def zip(arr1, arr2)
  new_arr = []

  arr1.each_with_index do |el, idx|
    new_arr << [el, arr2[idx]]
  end
  new_arr
end

# recursive by Nick Johnson
def zip(arr1, arr2)
  return [] if arr1.empty?
  [[arr1, arr2].map(&:first)] + zip(arr1.drop(1), arr2.drop(1))
end

p zip([1, 2, 3], [4, 5, 6]) #== [[1, 4], [2, 5], [3, 6]]
