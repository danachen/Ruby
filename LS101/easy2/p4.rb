# Prob 4: When will I Retire?

puts "What is your age?" 
age = gets.chomp().to_i

puts "At what age would you like to retire?" 
retired = gets.chomp().to_i

puts "It's #{Time.now.year}. You will retire in #{retired - age + Time.now.year}."
puts "You have only #{retired - age} years of work to go!"
