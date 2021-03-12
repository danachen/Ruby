# Prob 3: Counting the Number of Characters

puts "Please write word or multiple words: "
input = gets.chomp.delete(' ')
length = input.length

puts "There are #{length} characters in #{input}."