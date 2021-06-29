class Nucleotide
  attr_reader :test_str
  VALID_NUCLEOTIDE = 'ACGT'

  def initialize(test_str)
    @test_str = test_str
  end

  def self.from_dna(test_str)
    raise ArgumentError if test_str =~ /[^#{VALID_NUCLEOTIDE}]/
    new(test_str)
  end

  def count(target)
    test_str.count(target)
  end

  def histogram
    VALID_NUCLEOTIDE.chars.each_with_object({}) do |str, result|
      result[str] = count(str)
    end
  end
end