module GameEngine

  def play_game(token)
    board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    puts "Please choose your next move"
    print_board(board)
    player_move_number = get_player_move()
    new_board = make_move(board, token, player_move_number)
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

  def get_player_move
    puts "Enter a number from 1 - 9 to make a move."
    gets.strip().to_i
  end
end
