module GameLibrary
  def welcome_player
    puts Paint["Welcome to Tic Tac Toe!", :magenta]
  end

  def ask_player_for_token_choice
    puts Paint["Would you like to play as X or O?", :magenta]
  end

  def get_player_token_choice
    puts Paint["(Please enter X or O and then hit enter)", :yellow]
    a = gets.strip()
    puts "you said " + a
  end
end
