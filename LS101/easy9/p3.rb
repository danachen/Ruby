# Prob 3: Always Return Negative

# Write a method that takes a number as an argument. If the argument is a positive number, 
# return the negative of that number. If the number is 0 or negative, return the original number.

def negative(num)

  if num <=0
    num
  else 
    num * -1
  end
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0 

# Official

num > 0 ? -num : num