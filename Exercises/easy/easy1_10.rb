# Count Items, solving it 2 ways, one without each or while

# def count(input)
#   counter = 0
  
#   input.each do |el|
#     counter += 1 if yield(el)
#   end
#   counter
# end

def count(input)
  input.reduce(0) do |sum, el|
    yield(el) ? sum + 1 : sum
  end
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2