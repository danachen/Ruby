# Prob one: Sum of Sums

# Write a method that takes an Array of numbers and then returns the sum of the sums of each 
# leading subsequence for that Array. You may assume that the Array always contains at 
# least one number.

# loop through each number, loop 1, counter=0, take 3, loop 2, counter=1, take 3..5, have a temp
# array set up, and sum up each one


# def sum_of_sums(arr)
#   sum = 0
#   cumu_sum = 0
#   counter = 0
#   temp_arr = []
  
#   loop do 
#     temp_arr << arr[counter]
#     temp_arr.each {|num| sum+=num}
#     cumu_sum += sum
#     counter += 1
#     sum = 0
#     break if counter == arr.size
#   end

#   cumu_sum
# end

def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    puts count
    puts sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end


p sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) #== 4
# p sum_of_sums([1, 2, 3, 4, 5]) #== 35

# Official

