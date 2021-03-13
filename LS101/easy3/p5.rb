# Prob 5: Squaring an Argument

def multiply(one, two)
  one * two
end

def square(num)
  multiply(num, num)
end


p square(5) == 25
p square(-8) == 64