module GameEngine
  def play_game(token)
    puts "Please choose your next move"
    print_board()
  end

  def print_board
    puts "1 | 2 | 3 "
    puts "----------"
    puts "4 | 5 | 6 "
    puts "----------"
    puts "7 | 8 | 9 "
  end

  def welcome_player
    puts Paint["Welcome to Tic Tac Toe!", :magenta]
  end

  def ask_player_for_token_choice
    puts Paint["Would you like to play as X or O?", :magenta]
  end

  def get_player_token_choice
    puts Paint["(Please enter X or O and then hit enter)", :yellow]
    gets.strip()
  end
end
