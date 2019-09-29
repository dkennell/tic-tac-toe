module GameEngine

  def play_game(token)
    board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    while game_not_over?
      play_next_move(board, token)
    end
  end

  def play_next_move(board, token)
    if human_plays_first?(token)
      human_makes_move(board, 'X')
      computer_makes_move(board, 'O')
    else
      computer_makes_move(board, 'X')
      human_makes_move(board, 'O')
    end
  end

  def human_makes_move(board, token)
    puts "Please choose your next move"
    player_move_number = get_human_player_move(board)
    new_board = make_move(board, token, player_move_number)
  end

  def computer_makes_move(board, token)
    puts " ╚╚|░☀▄☀░|╝╝ computer is thinking..."
    sleep(2)
    puts " "
    player_move_number = get_computer_player_move(board)
    new_board = make_move(board, token, player_move_number)
    puts "computer moved!"
    sleep(1)
    print_board(new_board)
    new_board
  end

  def print_board(board)
    puts "#{board[0]} | #{board[1]} | #{board[2]} "
    puts "----------"
    puts "#{board[3]} | #{board[4]} | #{board[5]} "
    puts "----------"
    puts "#{board[6]} | #{board[7]} | #{board[8]} "
  end

  def make_move(board, token, player_move_number)
    board[player_move_number - 1] = token
  end

  def welcome_player
    puts Paint["Welcome to Tic Tac Toe!", :magenta]
  end

  def get_human_player_move(board)
    puts "Enter a number from 1 - 9 to make a move."
    gets.strip().to_i
  end

  def get_computer_player_move(board)
    generate_random_move_from_board(board)
  end

  def generate_random_move_from_board(board)
    move_options = get_move_options(board)
    move_options.sample
  end

  def get_move_options(board)
    board.each_with_index.map {
      |square, i| i + 1 if square == " "
    }.compact
  end

  def human_plays_first?(token)
    ["X", "x"].include?(token)
  end

  def game_not_over?
    true
  end
end
