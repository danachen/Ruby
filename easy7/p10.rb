# Prob 10: The End Is Near But Not Here

def penultimate(input)

  input.split[-2]

end


p penultimate('last word') #== 'last'
p penultimate('Launch School is great!') #== 'is'