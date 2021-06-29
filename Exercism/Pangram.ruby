class Pangram
 
  ALPHABET = ("a".."z").to_a
  
    def self.pangram?(str)
      str.scan(/[a-z]/i).map(&:downcase).select { |el| ALPHABET.include?(el) }.uniq.sort == ALPHABET
    end
  end