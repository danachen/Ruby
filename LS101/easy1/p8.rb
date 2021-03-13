# Prob 8: Array Average

def average(arr)
  arr.map.reduce(:+)/arr.length
end


puts average([1, 5, 87, 45, 8, 8]) #== 25
puts average([9, 47, 23, 95, 16, 52]) #== 40