# Circular Queue  **** super hard, not sure I understand the q and de-q classes

class CircularQueue

  def initialize(size)      #initialize array and positions
    @array = [nil] * size # nil to initialize empty buffer positions
    @next_position = 0 # pointer to the oldest object currently in array
    @oldest_position = 0 # pointer to next spot where new object is injected
  end

  def enqueue(object)
    unless @array[@next_position].nil?  # if the next position has nothing
      @oldest_position = increment(@next_position)  # then oldest position is the next position
  end

    @array[@next_position] = object   # ````takes the input and puts it in the array for the next position
    @next_position = increment(@next_position)
  end

  def dequeue
    value = @array[@oldest_position]
    @array[@oldest_position] = nil
    @oldest_position = increment(@oldest_position) unless value.nil?
    value
  end

  private

  def increment(position) # increments the position pointer, wraps around 0 when necessary
    (position + 1) % @array.size
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil