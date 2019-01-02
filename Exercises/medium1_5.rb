# Passing Parameters Part 3

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

puts "part 1"
gather(items) do |*others, grains |
  puts others.join(', ')
  puts grains
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

puts "part 2"
gather(items) do |fruit, *veggies, grains |
  puts fruit
  puts veggies.join(', ')
  puts grains
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

puts "part 3"
gather(items) do |fruit, *others |
  puts "#{fruit}"
  puts "#{others.join(', ')}"
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

puts "part 4"
gather(items) do |*all, last|
  puts "#{all.join(', ')} and #{last}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
