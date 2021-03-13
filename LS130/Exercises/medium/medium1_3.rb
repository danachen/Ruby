# Passing Parameters Part 1

# Modify the method below so that the display/output of items is moved to a block, 
# and its implementation is left up to the user of the gather method.

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

items = ['apples', 'corn', 'cabbage', 'wheat']
gather(items) { |item| puts item.join(', ')}