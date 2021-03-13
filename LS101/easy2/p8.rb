# Prob 8: Sum or Product of Consecutive Integers

puts "Please enter an integer greater than 0:"

int = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."

input = gets.chomp

sum_calc = 1.upto(int).reduce(:+)
prod_calc = 1.upto(int).reduce(:*)

if input == 's'

    puts "The sum of the integers between 1 and #{int} is #{sum_calc}."

  elsif input == 'p'
    puts "The product of the integers between 1 and #{int} is #{prod_calc}."
end