class DNA
  attr_reader :original_str
  def initialize(str1)
    @original_str = str1
  end

  def hamming_distance(str2)
    min_length = [original_str.length, str2.length].min
    [*0..min_length - 1].count {|n| original_str[n] != str2[n] }
  end
end