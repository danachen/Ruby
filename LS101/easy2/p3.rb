# Prob 3: Tip calculator

puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage? "
tip_perc = gets.chomp.to_f


puts "The tip is $#{(bill * tip_perc / 100).round(0)}"
puts "The total is $#{(bill + tip_perc).round(0)}"