# Highest and Lowest Ranking Cards # didn't solve, issues with value and <=> comparison

class Card
  attr_reader :rank, :suit
  include Comparable

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }


  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{@rank} of #{@suit}"
  end
  
  def value
    VALUES.fetch(@rank, @rank) # looks for the value from key @rank, with @rank filling in default value
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end

# Outputs:
cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
# puts cards
puts cards.min #== Card.new(2, 'Hearts')
puts cards.max #== Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#          Card.new(4, 'Diamonds'),
#          Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#          Card.new('Jack', 'Diamonds'),
#          Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

# cards = [Card.new(8, 'Diamonds'),
#          Card.new(8, 'Clubs'),
#          Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8

# 2 of Hearts
# 10 of Diamonds
# Ace of Clubs
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
