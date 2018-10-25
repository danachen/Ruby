require 'yaml'

MESSAGES = YAML.load_file('messages.yml')

module Formattable

  WIDTH = 48
  
  private

  def message(key)
    MESSAGES[key]
  end

  def prompt(message)
    puts("#{message}")
  end
end

module Displayable
  BOT_PLAYERS = { '1': 'R2D2', '2': 'Hal', '3': 'Chappie', '4': 'Sonny', '5': 'Number 5' }.freeze

  HANDS = { r: 'rock', p: 'paper', s: 'scissors', sp: 'sprock', l: 'lizard' }.freeze

  HANDS_IN_A_GAME = 3

  private

  def display_welcome
    prompt(message('welcome_message'))
    prompt("Player that wins the first #{HANDS_IN_A_GAME} rounds wins the game.")
  end

  def display_bot_players
    BOT_PLAYERS.map do |k, v|
      "#{k}. #{v} "
    end
  end

  def display_hands
    HANDS.map do |k, v|
      "#{v.capitalize}(#{k})"
    end.join(', ')
  end

  def display_goodbye
    prompt(message('goodbye_message'))
  end

  def display_game_choices
    prompt("#{human.name} has chosen #{human.move}.")
    prompt("#{bot.name} has chosen #{bot.move}.")
  end

  def display_winner
    announce_player_outcome
  end

  def display_game_results
    results = track_game_results
    prompt("Wins       #{game_results[0]}         #{game_results[1]}")
  end

  def display_round_results
    game_history.each do |k, v|
      prompt("  #{k}      #{v[0]}    #{v[1]}")
    end
  end

  def display_overall_winner
    prompt(message('board1'))
    if game_results[0] > game_results[1]
      prompt("#{human.name} is the overall winner!")
    elsif game_results[0] < game_results[1]
      prompt("#{bot.name} is the overall winner!")
    else
      prompt("We have a tie overall!")
    end
    prompt(message('board1'))
  end

  def display_game_board
    prompt(message('board1'))
    prompt(message('board2'))
    prompt(message('board1'))
    prompt(message('game_results'))
    prompt(message('board3'))
    prompt("Round     #{human.name}     #{bot.name}")
    display_round_results
    display_game_results
    prompt(message('board3'))
  end
end

class Player
  attr_accessor :move, :name
  include Formattable, Displayable

  def initialize
    @move = move
  end
end

class Human < Player
  def set_name
    human_name = nil
    loop do
      prompt(message('human_name_prompt'))
      human_name = gets.chomp
      break unless valid_human_name?(human_name)
      prompt(message('valid_human_name'))
    end
    self.name = human_name
  end

  def valid_human_name?(name)
    name.empty?
  end

  def make_move
    human_move = nil
    loop do
      prompt(message('choose_human_hand'))
      prompt(display_hands)
      human_move = gets.chomp.to_sym
      break if valid_human_move?(human_move)
      prompt(message('valid_hand_choice'))
    end
    self.move = HANDS[human_move]
  end

  def valid_human_move?(move)
    HANDS.keys.include?(move)
  end
end

class Robot < Player
  def set_name
    bot_name = nil
    loop do
      prompt(message('welcome_robot_name_prompt'))
      prompt(message('welcome_bot_choices'))
      prompt(message('welcome_enter_choice'))
      bot_name = gets.chomp
      break if BOT_PLAYERS.keys.include?(bot_name.to_sym)
      prompt(message('valid_bot_choice'))
    end
    self.name = BOT_PLAYERS.values_at(bot_name.to_sym).join
  end

  def make_move
    self.move = HANDS[HANDS.keys.sample]
  end
end

class Move
  attr_reader :name

  def initialize
    @name = self.class.name
  end
end

class Rock < Move
  def >(other)
    other.name == 'scissors' || 'lizard'
  end
end

class Paper < Move
  def >(other)
    other.name == 'rock' || 'lizard'
  end
end

class Scissors < Move
  def >(other)
    other.name == 'paper' || 'lizard'
  end
end

class Lizard < Move
  def >(other)
    other.name == 'paper' || 'sprock'
  end
end

class Sprock < Move
  def >(other)
    other.name == 'scissors' || 'rock'
  end
end

class Game
  attr_accessor :human, :bot, :game_results, :game_history_human, :game_history_bot, :game_counter, :game_history_each_hand, :game_history_hash
  include Formattable, Displayable

  private

  def initialize
    @human = Human.new
    @bot = Robot.new
    @game_results = Array.new(2, 0)
    @game_history_human = Array.new()
    @game_history_bot = Array.new()
    @game_history_each_hand = Array.new()
    @game_counter = 0
    @game_history_hash = Hash.new()
  end

  def confirm_choices
    prompt(message("confirm_human_name_and_bot_choice"))
    prompt("#{human.name} is playing against #{bot.name} today.")
  end

  def player_one_win_lose?
    if human.move > bot.move
      'won'
    elsif bot.move > human.move
      'lost'
    else
      'tie'
    end
  end

  def track_game_results
    if player_one_win_lose? == 'won'
      game_results[0] += 1
    elsif player_one_win_lose? == 'lost'
      game_results[1] += 1
    end
    game_results
  end

  def announce_player_outcome
    if player_one_win_lose? == 'tie'
      prompt(message("tie"))
    else
      prompt("#{human.name} has #{player_one_win_lose?}!")
    end
  end

  def track_game_history_human
    game_history_human << human.move
  end

  def track_game_history_bot
    game_history_bot << bot.move
  end

  def track_game_history_each_hand
    track_game_history_human
    track_game_history_bot
    game_history_each_hand = game_history_human.zip(game_history_bot).last
  end

  def track_game_counter
    @game_counter += 1
  end

  def game_history
    track_game_counter
    track_game_history_each_hand
    @game_history_hash[game_counter] = track_game_history_each_hand
    @game_history_hash
  end

  def play_again_input
    play_again = nil
    loop do
      prompt(message('want_to_play_again'))
      play_again = gets.chomp
      break if ['y', 'n'].include?(play_again)
      prompt(message('valid_play_again_choice'))
    end
    play_again
  end

  def winner_yet?
    game_results.any?(HANDS_IN_A_GAME)
  end

  def play_again?
    true unless play_again_input == 'n'
  end

  def clear
    system "clear"
  end

  public

  def start_game
    clear
    display_welcome
    human.set_name
    bot.set_name
    confirm_choices
  end

  def play
    start_game
    loop do
      human.make_move
      bot.make_move
      display_game_choices
      display_winner
      display_game_board
      break if winner_yet? || !play_again?
      clear
    end
    display_overall_winner
    display_goodbye
  end
end

Game.new.play
