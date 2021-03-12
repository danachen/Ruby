# Prob 2: Odd

# returns true or false (boolean return) based on if the value is even/odd (odd is true)

def is_odd?(input)

  if input % 2 == 1
    true
  else
    false
  end

end





puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true