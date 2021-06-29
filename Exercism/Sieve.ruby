class Sieve
  attr_reader :range, :limit

  def initialize(limit)
    @limit = limit
    @range = [*0..limit]
  end

  def primes
    range[0] = range[1] = nil
    range.each do |n|
      next unless n
      break if n.abs2 > limit
      n.abs2.step(limit, n) { |m| range[m] = nil }
    end
    range.compact
  end
end