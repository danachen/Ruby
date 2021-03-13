# Prob 9: Fibonacci Numbers (Procedural)



# def fibonacci(n)

#   current_num = 1 # index 0
#   current_num_next = 1 # index 1
#   count = 1

#   loop do 
#     p current_num = current_num + current_num_next # index 2 = index 0+index 1 = 2
#     p current_num_next = current_num_next + current_num # index 3,
#     # current_num = current_num_next + current_num # index 4 is 5, index 2 + index 3 
#     # current_num_next = current_num + current_num_next  # index 5 is 8, index 3 + index 4 = 3+5
#     # current_num = current_num_next + current_num  # index 6 is 13

#     count += 2
#     break if count > n
#   end
#   current_num
# end

# 1, 1, 2, 3, 5, 8, 13, 21, 34, 55

def fibonacci(n)

  current_num = 1 
  current_num_next = 1
  sum = current_num + current_num_next
  count = 2

  loop do 
    current_num = current_num_next 
    current_num_next = sum
    sum = current_num + current_num_next
    # puts "sum is #{sum} and current value is #{current_num} and current next is #{current_num_next}"
    count += 1
    break if count > n - 2
  end
  sum
end


# official solution

def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) => 4202692702.....8285979669707537501







