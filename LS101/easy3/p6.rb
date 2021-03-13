# Prob 6: Exclusive Or

def xor?(args1, args2)

  true if args1 == true && args2 == false || args1 == false && args2 == true 

end


p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# refactor this to: 

# (args1 && !args2) || (args2 && !args1)