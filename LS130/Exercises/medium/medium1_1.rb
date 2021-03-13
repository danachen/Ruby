# Medium 1_1: Listening Device

# yielding
# class Device
#   def initialize
#     @recordings = []
#   end

#   def record(recording)
#     @recordings << recording
#   end

#   def listen
#     block = yield
#     record(block)
#   end

#   def play
#     puts @recordings.last
#   end
# end

# using block.call
class Device
  def initialize
    @recordings = []
  end

  def listen(&recording)
    record(recording) if block_given?
  end

  def record(recording)
    recording = recording.call
    @recordings << recording
  end

  def play
    puts @recordings.last
  end
end


listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"
