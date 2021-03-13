# Basic solution
require 'prime'

class Sieve
  attr_reader :arr, :arr_prime
  def initialize(limit)
    @arr = [*2..limit]
    @arr_prime = [*2..Math.sqrt(limit)]
  end

  def primey
    @arr.select do |n|
      Prime.prime?(n)
    end
  end

  def primey
    arr_prime.each do |prime|
      arr.reject! {|num| (num != prime && num % prime == 0)}
    end
    arr
  end
end

# Solution 2: more efficient

class Sieve
  attr_reader :nums, :limit

  def initialize(limit)
    raise ArgumentError, 'Input has to be greater than 2.' if limit < 2
    @limit = limit
    @nums = (0..limit).to_a
  end

  def primes
    nums[0] = nums[1] = nil
    nums.each do |n|
      next unless n
      break if n.abs2 > limit
      n.abs2.step(limit, n) {|m| nums[m] = nil}
    end
    nums.compact
  end
end

# Solution 3: most efficient, 0.62 secs
class Sieve
  attr_reader :nums, :limit
  
  def initialize(limit)
    raise ArgumentError, 'Input has to be greater than 2.' if limit < 2
    @limit = limit
    @nums = (0..limit).to_a
  end

  def primes
    nums[0] = nums[1] = nil
    [*2 .. Math.sqrt(limit)].each do |n|
      next unless n
      n.abs2.step(limit, n) {|m| nums[m] = nil}
    end
    nums.compact
  end
end

# Solution with 1.2 seconds, using Hash
class Sieve
  def initialize(limit)
    @limit = limit
    @nums = (2..limit).map { |n| [n, true] }.to_h
  end

  def primes
    @nums.each { |num, prime| mark_multiples(num) if prime }.compact.keys
  end

  def mark_multiples(num)
    num.abs2.step(@limit, num).each do |multiple| 
      @nums[multiple] = nil
    end
  end
end

def benchmark
  start_time = Time.now
  yield
  puts "Seconds: #{Time.now - start_time}"
end

benchmark { p Sieve.new(1_000_000).primes == Prime.entries(1_000_000) }