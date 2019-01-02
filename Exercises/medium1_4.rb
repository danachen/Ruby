# Passing Parameters Part 2

# Based on the examples shown above, write a method that takes an array as an argument. 
# The method should yield the contents of the array to a block, 
# which should assign your block variables in such a way that it ignores the 
# first two elements, and groups all remaining elements as a raptors array.

# def assignment(arr)
#   yield(arr[1..-1]) if block_given?
# end

# raven, finch, *raptors = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p raptors  # => ['hawk','eagle']


def assignment(arr)
  yield(arr)
end

birds = %w(parrot ostrich eagle raven hawk)

assignment(birds) { |*_, *raptors| puts "Raptors: #{raptors.join(', ')}"}