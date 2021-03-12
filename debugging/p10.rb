# Prob 10: converting a nested array into a one-layer array

def buy_fruit(arr)

  # new_arr = []
  
  arr.map do |inner_arr|
    inner_arr[1].times {|word| inner_arr[0]}
  end
    arr
end


p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #== ["apples", "apples", "apples", "orange", "bananas","bananas"]