# 1. basic solution
class Prime
  def self.nth(limit)
    counter = 3
    arr = [2]
    return arr.first if limit == 1
    return raise ArgumentError if limit == 0
    loop do 
      arr << counter if prime?(counter)
      counter += 2
      break if arr.size == limit
    end
    arr.last
  end

  def self.prime?(counter)
    (2..Math.sqrt(counter)).select { |n| counter % n == 0}.empty?
  end
end

def benchmark
  start_time = Time.now
  yield
  puts "Seconds: #{Time.now - start_time}"
end

benchmark { Prime.nth(30_000) } 
# my solution: 82 secs, 30K in 11 secs

# 2. faster solution, this one runs through each number through known primes instead of all nums
class Prime
  def self.nth(num)
    fail ArgumentError unless num > 0
    @primes = [2]
    current_num = 3
    while @primes.length < num
      @primes << current_num if is_prime?(current_num)
      current_num += 2
    end
    @primes.last
  end

  def self.is_prime?(num)
    @primes.each do |prime|
      return false if num % prime == 0
      break true if prime > Math.sqrt(num)
    end
  end
end

def benchmark
  start_time = Time.now
  yield
  puts "Seconds: #{Time.now - start_time}"
end

benchmark { Prime.nth(300_000) } 
# does 30K in 0.54sec, 300K in 11 secs

#3. procedural, can do it under 1 sec

class Prime
  
  LIMIT = 3_000_000
  @@sieve = []

  [*2..LIMIT].each { |el| @@sieve[el] = el}
  
  [*2 .. Math.sqrt(LIMIT)].each do |n|
    next unless @@sieve[n]
    n.abs2.step(LIMIT, n) { |m| @@sieve[m] = nil }
  end
  @@sieve.compact!

  def self.nth(n)
    raise ArgumentError if n < 1
    return 2 if n == 1
    @@sieve[0...n].last
  end
end

def benchmark
  start_time = Time.now
  yield
  puts "Seconds: #{Time.now - start_time}"
end

p Prime.nth(5)

benchmark { Prime.nth(3_000_000) } 
# done in no time, 3M in 0.000141 secs

#4. Rewriting the Ruby code, just over 1 sec
class Prime
  LIMIT = 3_000_000

  def self.nth(n)  
    raise ArgumentError if n < 1
    return 2 if n == 1
    @sieve_arr = []

    [*2..LIMIT].each { |el| @sieve_arr[el] = el}
    
    [*2 .. LIMIT].each do |n|
      break if n.abs2 > LIMIT
      next unless @sieve_arr[n]
      n.abs2.step(LIMIT, n) { |m| @sieve_arr[m] = nil }
    end
    
    @sieve_arr.compact[0...n].last
  end
end

def benchmark
  start_time = Time.now
  yield
  puts "Seconds: #{Time.now - start_time}"
end

benchmark { Prime.nth(3_000_000) } 

# this solution does provide an upper limit
class Prime
  def self.nth(n)
    raise ArgumentError if n <= 0
    upper_limit = n * (Math.log(n)+2)
    primes_array = [nil, nil] + [*2..upper_limit]

    [*2 .. Math.sqrt(upper_limit)].each do |n|
      next unless primes_array[n]
      n.abs2.step(upper_limit, n) { |m| primes_array[m] = nil }
    end
    primes_array.compact[n-1]
  end
end

def benchmark
  start_time = Time.now
  yield
  puts "Seconds: #{Time.now - start_time}"
end

benchmark { Prime.nth(3_000_000) } 