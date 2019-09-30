module GameEngine
  require_relative './Game'

  WIN_COMBINATIONS = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7]
  ]

  def welcome_player
    puts Paint["Welcome to Tic Tac Toe!", :magenta]
  end

  def print_instructions
    puts Paint["This game is played using the keyboard, and selecting the squares you want by entering the corresponding number for that square, shown below.", "#40ff67"]
    puts " "
  end

  def print_example_board
    puts "1 | 2 | 3 "
    puts "----------"
    puts "4 | 5 | 6 "
    puts "----------"
    puts "7 | 8 | 9 "
    puts " "
    sleep(1)
  end

  def play_game(token)
    board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    game = Game.new(token, board)
    while !game.game_over?
      game.play_next_move
    end
  end
end
