class Game
  attr_accessor :player_token, :current_player, :board

  def initialize(player_token, board)
    @player_token = player_token
    @board = board
    @current_player = "X"
  end

  def play_next_move
    if current_player_is_human
      human_makes_move
    else
      computer_makes_move
    end
    continue_to_next_move
  end

  def make_move(player_move_number)
    @board[player_move_number - 1] = @current_player
  end

  def human_makes_move
    puts "Please choose your next move"
    player_move_number = get_human_player_move
    make_move(player_move_number)
    puts " "
    puts "player is thinking... 	(¬_¬'')	"
    puts " "
    sleep(2)
    puts "player moved!"
    puts " "
    sleep(1)
    print_board
  end

  def get_human_player_move
    puts "Enter a number from 1 - 9 to make a move."
    puts " "
    gets.strip().to_i
  end

  def computer_makes_move
    puts " "
    puts " ╚╚|░☀▄☀░|╝╝ computer is thinking..."
    sleep(2)
    puts " "
    player_move_number = get_computer_player_move
    make_move(player_move_number)
    puts "computer moved!"
    puts " "
    sleep(1)
    print_board
  end

  def get_computer_player_move
    generate_random_move_from_board
  end

  def generate_random_move_from_board
    move_options = get_move_options
    move_options.sample
  end

  def get_move_options
    board_slot_numbers_containing_a_given_value(" ")
  end

  def board_slot_numbers_containing_a_given_value(value)
    @board.each_with_index.map {
      |square, i| i + 1 if square.downcase == value.downcase
    }.compact
  end

  def continue_to_next_move
    @current_player = next_player
  end

  def next_player
    @current_player == "X" ? "O" : "X"
  end

  def current_player_is_human
    @player_token.downcase == @current_player.downcase
  end

  def game_over?
    game_won || game_tied
  end

  def game_won
    board_slots_with_x = board_slot_numbers_containing_a_given_value("X")
    board_slots_with_o = board_slot_numbers_containing_a_given_value("O")
    WIN_COMBINATIONS.each do |combo|
      x_won = contains_subarray(board_slots_with_x, combo)
      o_won = contains_subarray(board_slots_with_o, combo)
      if x_won or o_won
        declare_victory(x_won)
        return true
      end
    end
    return false
  end

  def game_tied
    if !game_won && board_full
      declare_tie
      return true
    end
  end

  def declare_tie
    puts "Oh no! The game was a tie! You are both losers! :("
  end

  def board_full
    !@board.any? { |square| square == " "}
  end

  def declare_victory(x_won)
    if x_won && @player_token.downcase == "x" || !x_won && @player_token.downcase == "o"
      declare_player_victory
    else
      declare_computer_victory
    end
  end

  def declare_player_victory
    puts " "
    puts "Player wins!"
  end

  def declare_computer_victory
    puts " "
    puts "Computer wins!"
  end

  def print_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "----------"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "----------"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts " "
    sleep(1)
  end

  def contains_subarray(array, subarray)
    (subarray - array).empty?
  end
end
