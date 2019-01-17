class SumOfMultiples
attr_reader :factors
  
  def initialize(*args)
    @factors = args
  end

  def self.to(num)
    new(3, 5).to(num)
  end

  def to(num)
    new_arr=[]
    0.upto(num-1).select do |n|
      new_arr << n if @factors.any? {|factor| n % factor == 0}
    end
    new_arr.reduce(:+)
  end
end

p SumOfMultiples.new(7, 13, 17).to(20)

