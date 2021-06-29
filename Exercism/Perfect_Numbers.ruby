class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num.negative?

    if num_sum(num) < num
      'deficient'
    elsif num_sum(num) > num
      'abundant'
    else
      'perfect'
    end
  end

  def self.num_sum(num)
    [*1...num].select { |n| num % n == 0 }.sum
  end
end