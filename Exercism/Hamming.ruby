class Hamming
  def self.compute(str1, str2)
    raise ArgumentError if str1.size != str2.size
    str1.size.times.count { |idx| str1[idx] != str2[idx] }
  end
end