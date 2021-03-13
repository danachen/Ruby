# Prob 5: Card Deck

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace] # an array of cards

deck = { :hearts   => cards,
         :diamonds => cards,
         :clubs    => cards,
         :spades   => cards }
# a hash table of 4 types

def score(card)
  case card
  when :ace   then 11   # assigns value to each symbol, helps with scoring
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit| # this generates the full deck of cards, by iterating through each card type
  cards = deck[suit] 
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, cards)|
  cards.map do |card|
    score(card)
  end

  sum += cards.sum
end

puts sum


