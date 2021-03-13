# Number Guesser Part 2 - solved, but required some help with the @, not sure how to deploy still
# used the cover?() method to get out of setting up custom operator overloads

require 'pry'

class GuessingGame

attr_accessor :counter
attr_reader :guess_no, :target_num, :low, :high

  def initialize(low, high)
    @low = low
    @high = high
    @counter = Math.log2(@high - @low + 1).to_i + 1
    @guess_no = nil
    @target_num = 0
  end

  def play
    random_no_generator
    
    loop do 
      counter_display
      enter_a_number
      break if out_of_guesses || too_high_too_low
    end
    good_bye
  end

  private
  def random_no_generator
    @target_num = rand(@low..@high)
    # binding.pry
  end

  def counter_display
    puts "You have #{@counter} turns remaining."
  end

  def enter_a_number
    puts "Enter a number between #{@low} and #{@high}:"
    loop do 
      @guess_no = gets.chomp.to_i
      break if (@low..@high).cover?(@guess_no)
      puts "Sorry, try again within the range specified."
    end
    @counter -= 1
  end

  def too_high_too_low
    if guess_no < target_num
      puts "Your guess is too low!"
    elsif guess_no > target_num
      puts "Your guess is too high!"
    else 
      puts "The correct number is indeed #{@target_num}. You win!"
      true
    end
  end

  def out_of_guesses
    if @counter == 0
      puts "The correct number is #{@target_num}. You are out of guesses. You lose." 
      return true
    end
  end

  def good_bye
     puts "Thank you for playing!"
  end
end

game = GuessingGame.new(501, 1000)
game.play
