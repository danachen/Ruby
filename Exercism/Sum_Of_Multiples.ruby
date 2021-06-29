class SumOfMultiples
  def initialize(*base_nums)
    @base_nums = base_nums
  end

  def to(limit)
    return 0 if @base_nums.join.to_i == 0
    return @base_nums if @base_nums.join == ''
    
    max_multiplier = (limit / (@base_nums[0])).floor
    
    @base_nums.each_with_object([]) do |num, obj|
      (1..max_multiplier).to_a.each do |multiplier|
        break if num * multiplier >= limit
        obj << num * multiplier
      end
    end.uniq.sum
  end
end