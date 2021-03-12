# Prob 6: fizzbuzz

# Write a method that takes two arguments: the first is the starting number, 
# and the second is the ending number. Print out all numbers between the two numbers, 
# except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, 
# print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

# method to print numbers between the range, 1..upto(2) do |num|
# if num % 15 puts, elsif, elsif, else



# def fizzbuzz (n1, n2)

#   n1.upto(n2) do |num|
#     if num % 15 == 0
#       p 'FizzBuzz'
#     elsif num % 3 ==0
#       p 'Fizz'
#     elsif num % 5 ==0
#     p 'Buzz'
#     else
#     p num
#     end
#   end

# end



def fizzbuzz (num1, num2)
  new_arr = []

  num1.upto(num2) do |num|
    new_arr << fizzbuzz_case(num)
  end

new_arr 
end


def fizzbuzz_case(number)
  case 

  when number % 15 ==0
    'a'
  when number % 5 ==0
    'b' 
  when number % 3 ==0
    'c'
  else 
    number
  end

end

p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
