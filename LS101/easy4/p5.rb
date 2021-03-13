# Prob 5: Multiples of 3 and 5

# Write a method that searches for all multiples of 3 or 5 that lie between 1 and 
# some other number, and then computes the sum of those multiples. For instance, 
# if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).


# Given the number 10, need to find multiples of 3 and 5, and compute the sums of those multiples.
# 3, 5, 6, 9, 10 = 33
# what is the best way to look for multiple of a number?

# take the number 10, best way to find multiples of 3, is to take 3, 3*1, 3*2, 3*3, till it hits
# 10, same with 5, 5*1, 5*2

def multisum(input)

  counter1, counter2 = [0, 0]
  arr = []

  loop do 
    counter1 += 1   
    multiple1 = 3 * counter1
    break if multiple1 > input
    arr << multiple1
  end
  
  loop do 
    counter2 += 1   
    multiple2 = 5 * counter2
    break if multiple2 > input
    arr << multiple2
  end

  p arr.uniq.reduce(:+)
end


# multisum(3) #== 3
# multisum(5) #== 8
# multisum(10) #== 33
# multisum(15) #== 3, 5, 6, 9, 10, 12, 15, 15 = 75
# multisum(1000) #== 234168

# this is a pretty good one
def multisum(n)
  1.upto(n).select { |x| x % 3 == 0 || x % 5 == 0 }.inject(:+)
end

