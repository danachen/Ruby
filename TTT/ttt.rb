module Displayable
  def display_welcome_message
    puts "Welcome to Tic Tac Toe, #{human.name}!"
    puts "Whoever wins the first #{Game::MATCH_CALL} games win!"
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe #{human.name}, Goodbye!"
    puts ""
  end

  def display_board
    puts ""
    puts "#{human.name} the human is using #{human.marker}."
    puts "#{computer.name} the bot is using #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def display_move_prompt
    puts "Choose a square (#{joiner(board.unmarked_keys, ', ', ', or ')}): "
  end

  def display_human_moves
    puts ""
    puts "*************************************************"
    puts "#{human.name}, you've made the following moves:"
    puts "#{human.move_history}."
  end

  def display_bot_moves
    puts "#{computer.name} the bot has made the following moves:"
    puts "#{computer.move_history}."
    puts "*************************************************"
    puts ""
  end

  def display_score
    puts "=================================================="
    puts "#{human.name}, you have a cumulative score of #{human.score}!"
    puts "#{computer.name} the bot has a cumulative score of #{computer.score}!"
    puts "=================================================="
    puts ""
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def display_result
    clear_screen_and_display_board
    puts "$$$$$$$$$$$$$$$$$$$$$$$$"
    determine_winning_marker
    puts "$$$$$$$$$$$$$$$$$$$$$$$$"
  end

  def determine_winning_marker
    case board.winning_marker
    when human.marker
      puts "#{human.name}, you won!"
      human.score += 1
    when computer.marker
      puts "#{computer.name} the bot won!"
      computer.score += 1
    else
      puts "It's a tie!"
    end
  end
end

module Formattable
  def clear_screen_and_display_board
    clear
    display_board
  end

  def joiner(arr, s1, s2)
    if arr.size > 1
      arr[0..-2].join(s1).to_s + s2 + board.unmarked_keys.last.to_s
    else
      arr.join
    end
  end

  def clear
    system "clear"
  end

  def reset
    board.reset
    @current_marker = human.marker
    clear
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def marked_keys
    @squares.keys.select { |key| @squares[key].marked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :marker, :name, :score, :move_history

  def initialize
    @marker = nil
    @name = nil
    @score = 0
    @move_history = []
  end
end

class Human < Player
  def set_your_name
    temp_name = nil
    puts "What's your name?"
    loop do
      temp_name = gets.chomp
      break unless valid_human_name?(temp_name)
      puts 'Please enter a valid name.'
    end
    self.name = temp_name
    puts ""
  end

  def valid_human_name?(name)
    name.strip.empty?
  end
end

class Computer < Player
  def set_computer_name
    self.name = Game::COMPUTER_NAME
    puts "You are playing against #{name} today!"
    puts ""
  end
end

class Game
  COMPUTER_NAME = "Chappie"
  FIRST_TO_MOVE = 'X'
  MATCH_CALL = 2

  attr_reader :board, :human, :computer

  include Displayable, Formattable

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @current_marker = FIRST_TO_MOVE
  end

  def play
    pre_play

    loop do
      display_board
      continue_playing?
      summary_play_moves_and_refresh
      break unless game_continues? && play_again?
      reset
      display_play_again_message
    end
    display_score
    display_goodbye_message
  end

  private

  def pre_play
    clear
    human.set_your_name
    display_welcome_message
    computer.set_computer_name
    set_marker
  end

  def summary_play_moves_and_refresh
    display_result
    display_human_moves
    display_bot_moves
    human.move_history.clear
    computer.move_history.clear
  end

  def game_continues?
    human.score < MATCH_CALL && computer.score < MATCH_CALL
  end

  def continue_playing?
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def set_marker
    puts "Please choose either X or O as your marker."
    puts "The player with marker X goes first."
    valid_marker_choice?
    computer.marker = ['X', 'O'].select { |v| v != human.marker }.join.to_s
  end

  def valid_marker_choice?
    loop do
      human.marker = gets.chomp.upcase!
      break if ['X', 'O'].include?(human.marker)
      puts "Sorry, that's not a valid choice."
    end
  end

  def human_moves
    display_move_prompt
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board[square] = human.marker
    human.move_history << square
  end

  def human_turn?
    @current_marker == human.marker
  end

  def human_history
    human.move_history
  end

  def bot_history
    computer.move_history
  end

  def bot_offensive
    Board::WINNING_LINES.each do |set|
      winning_set = bot_history & set
      winning_piece = (set - winning_set).join.to_i
      if winning_set.size == 2 && board.unmarked_keys.include?(winning_piece)
        bot_history << winning_piece
        return board[winning_piece] = computer.marker
      end
    end
    nil
  end

  def bot_defensive
    Board::WINNING_LINES.each do |set|
      winning_set = human_history & set
      winning_piece = (set - winning_set).join.to_i
      if winning_set.size == 2 && board.unmarked_keys.include?(winning_piece)
        computer.move_history << winning_piece
        return board[winning_piece] = computer.marker
      end
    end
    nil
  end

  def bot_first_move
    return unless board.unmarked_keys.include?(5)
    board[5] = computer.marker
    computer.move_history << 5
  end

  def bot_random
    current_play = board.unmarked_keys.sample
    computer.move_history << current_play
    board[current_play] = computer.marker
  end

  def computer_moves
    return unless bot_offensive.nil?
    bot_offensive
    return unless bot_defensive.nil?
    bot_defensive
    return bot_first_move unless bot_first_move.nil?
    bot_random
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "#{human.name}, press any key to continue"
      answer = gets.chomp
      break if answer
    end
    true
  end
end

game = Game.new
game.play
