puts "input number"
num=gets.to_i

if num>0 && num<=50
  puts "this is between 0 and 50"
elsif num>50 && num<=100
  puts "this is between 50 and 100"
else
  puts "greater than 100"
end