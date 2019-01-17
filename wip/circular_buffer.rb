# Problem PEDAC

# What is a circular buffer? Some properties of a buffer:

# 1. This is an empty 7-element buffer: [] x 7
# 2. Add one element: [][][][1][][][], does not matter where it is actually inserted
# 3. 2 more elemnts are added: [][][][1][2][3][]
# 4. 2 elements are read/removed, the oldest ones are removed, [][][][][][3][]
# 5. buffer is full [6][7][8][9][3][4][5], error is raised, blocked till slot is free
# 6. forcing overwrite [6][7][8][9][A][B][5]
# 7. if removing elements now, then it is the first ones removed [ ][7][8][9][A][B][ ]


# Notes from test cases
# 1. returns error if buffer is empty when trying to read
# 2. has two assertions, the first one passes if both written and read, but second read 
# attempt will result in empty error (read method must take the element off array once read once)
# 3. 3 assertions, 2 writes, 2 reads then pass, but 3rd read results in empty buffer error
# 4. test clear method, once written, cleared, any attempt to read will result in error
# 5. alternating writing and reading, nothing crazy
# 6. writing and reading, reading will always reach for the oldest element
# 7. nil should not occupy space in the buffer, writing nils should not matter
# 8. once the buffer is full, further writing will throw an error
# 9. how the write! method works, but forcing the oldest element out and taking its place
# 10. forced writes of nil does not take up any space
# 11. if buffer not full, write! behave just like write
# 12. basically a culmination of all the activities, ending in an empty buffer exception

class BufferEmptyException < StandardError
end

class CircularBuffer
  attr_accessor :buffer

  def initialize(buffer_size)
    @buffer = Array.new(buffer_size)
  end

  def read
    p buffer
    if buffer.none?
      raise BufferEmptyException, "CircularBuffer::BufferEmptyException" 
    else
      buffer[0] = nil
    end
  end

  def write(input)
    # need to insert a value into an empty array of nils
    # buffer = [nil], buffer = [1] and not buffer = [nil, 1]
    buffer.map do |el|
      el == nil ? el = input : el
    end
  end

  def write!
  end

  def clear
  end

end

buffer = CircularBuffer.new(1)
buffer.write(1)
p buffer.read