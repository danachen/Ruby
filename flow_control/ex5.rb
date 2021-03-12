puts "input number"
num=gets.to_i

case 
when num<0
  p "less than 0"
when num<50
  p "between 0 and 50"
when num<100
  p "between 50 and 100"
else num>100
  p "greater than 100"
end