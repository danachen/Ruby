# Divisors

# My solution:

def divisors(num)
  divisors = []
  1.upto(num) { |i| divisors << i if num % i == 0 }
  divisors
end

# Official solution:

# def divisors(number)
#   1.upto(number).select do |candidate|
#     number % candidate == 0
#   end
# end

# Further exploration:

# def divisors(num)
#   divisors = []
#   (1..Math.sqrt(num)).each { |i| divisors += [i, num / i] if num % i == 0 }
#   divisors.uniq.sort
# end

# Question: why is the range going from 1 ... sqrt of a number? Say the number is 49, the divisors
# are then 1, 7, 49

# If the number is 100, then the divisors are: [1, 2, 4, 5, 10, 20, 50, 100]
# say num = 100, (1..10).each {|i| divisors += [i, num / i] if num % n == 0}
# when i = 2, divisors += [2, 50] if 100 / 2 == 0
# when i = 10, divisors += [10, 10] if 100 / 10 == 0
# when i = 5, divisors += [5, 20] if 100 / 5 == 0

# ok, that's what it means that one half of the solution will give you the other half
# since one divisors will always give you another one
# also why you need uniq and sort, to make sure the array is sorted