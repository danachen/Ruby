# Prob one: Countdown

def decrease(counter)
  counter -= 1
end

counter = 10

counter.downto(1) do
  puts counter 
  counter = decrease(counter)
end

puts 'LAUNCH!'