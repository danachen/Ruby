# Deck of Cards # almost solved, similar to the 21 game in terms of initializng a deck
# difference is putting the initialize method into another, so don't need to reset it

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

class Deck
  attr_accessor :cards

  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def reset
    @cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def draw
    reset if @cards.empty?
    cards.pop
  end
end

# Output

deck = Deck.new
# puts deck.draw
drawn = []
52.times { drawn << deck.draw }
puts drawn
puts drawn.count { |card| card.rank == 5 } #== 4
puts drawn.count { |card| card.suit == 'Hearts' } #== 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.

