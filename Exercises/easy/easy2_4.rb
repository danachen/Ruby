# easy 2_4, #count

# Done with #each
def count(*args)
  new_arr = []

  args.each do |el|
    new_arr << el if yield(el)
  end
  new_arr.length
end

# Done with a counter
def count(*args)
  counter = 0

  args.each do |el|
    counter += 1 if yield(el)
  end
  counter
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3