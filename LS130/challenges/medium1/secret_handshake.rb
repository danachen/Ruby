class SecretHandshake
  attr_accessor :code_binary, :binary_arr

  TABLE = { 0 => '', 1 =>'wink', 10 => 'double blink', 100 => 'close your eyes', 1000 => 'jump' }

  def initialize(input)
    @code_binary = clean_code(input)
  end

  def commands
    if binary_arr_conversion.include?(10000)
      @binary_arr -= [10000]
      @binary_arr.reverse!
    end
    @binary_arr.map {|num| TABLE[num]}
  end

  private

  def clean_code(code)
    code.class == Integer ? code.to_s(2).to_i : code.to_i.to_s(2).to_i
  end

  def binary_arr_conversion
    pwr_of_tens = code_binary.to_s.size
    @binary_arr = []
    counter = 1

    loop do 
      remainder = code_binary % (10 ** counter)
      @code_binary -= remainder
      binary_arr.push(remainder)
      counter += 1
      break if counter > pwr_of_tens
    end
    @binary_arr -=[0]
  end
end

# or

class SecretHandshake
  attr_reader :input

  TABLE = { 1 =>'wink', 2 => 'double blink', 4 => 'close your eyes', 8 => 'jump' }

  def initialize(input)
    @input = input.to_i
  end

  def commands
    unless input & 16 == 16
      TABLE.select {|k, v| input & k == k }.values 
    else
      TABLE.select {|k, v| input & k == k }.values.reverse!
    end
  end
end

p SecretHandshake.new(1).commands