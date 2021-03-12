# Prob 3: Fibonacci Number Location By Length

# Write a method that calculates and returns the index of the first Fibonacci number 
# that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

# [1, 1, 2, 3, 5, 8, 13] - 13 is index 7, and is the first number with two digits
# note 7 is the array.size, and arr[7].to_s.size could give you the size of the digits
# need to return the index of the series that first produces the number of digits specified
# so for two digits, it's the 7th number
# create a loop so as to keep track of the 1. size of the series, and 2. digit of the last number
# returned?

def find_fibonacci_index_by_length (digits)

  series = []
  series[0] = 1
  series[1] = 1
  
  counter = 2

  loop do 
    series << series[counter - 1] + series[counter - 2]
    last_digit_size = series.last.to_s.size
    counter += 1
    break if last_digit_size == digits
  end
  
  counter
end



p find_fibonacci_index_by_length(2) #== 7
p find_fibonacci_index_by_length(10) #== 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847



