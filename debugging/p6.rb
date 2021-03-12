# Prob 6: Getting Things Done

def move(n, to_do, done_array)
  return if n == 0
  done_array << to_do.shift
  move(n - 1, to_do, done_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom', 'dinner with mom']
done = ['apply sunscreen', 'go to the beach']

move(4, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']