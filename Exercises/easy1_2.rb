# Optional Blocks

def compute
  raise TypeError, 'Does not compute.' unless block_given?
  yield if block_given?
end

# Official solution

# def compute 
#   return 'Does not compute.' unless block_given? 
#   yield
# end

# Other solutions

# def compute(arg) 
#   block_given? ? yield(arg) : "Does not compute: #{arg}”
# end