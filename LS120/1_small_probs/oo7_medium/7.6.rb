# Number Guesser Part 1 # solved!

class GuessingGame

attr_accessor :counter
attr_reader :guess_no, :target_num

  def initialize
    @counter = 7
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
    @target_num = rand(1..100)
  end

  def counter_display
    puts "You have #{@counter} turns remaining."
  end

  def enter_a_number
    puts "Enter a number between 1 and 100:"
    @guess_no = gets.chomp.to_i
    @counter -= 1
  end

  def too_high_too_low
    if @guess_no < target_num
      puts "Your guess is too low!"
    elsif @guess_no > target_num
      puts "Your guess is too high!"
    else 
      puts "The correct number is indeed #{@target_num}. You win!"
      true
    end
  end

  def out_of_guesses
    puts "The correct number is #{@target_num}. You are out of guesses. You lose." if @counter == 0
  end

  def good_bye
     puts "Thank you for playing!"
  end
end

game = GuessingGame.new
game.play
