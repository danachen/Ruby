class Raindrops

  SOUNDS = { 3 =>'Pling', 5 => 'Plang', 7 => 'Plong' }
  
  def self.convert(input)
    soundsFor(input) || input.to_s
  end

  private

  def self.soundsFor(input)
    result = SOUNDS
    n_result = result.map { |k, v| v if factor?(k, input) }.join
    n_result.empty? ? nil : n_result 
  end
  
  def self.factor?(factor, input)
    input % factor == 0 
  end
end