require 'paint'

puts Paint["Welcome to Tic Tac Toe! Would you like to play as X or O?", :magenta]
puts Paint["(Please enter X or O and then hit enter)", :yellow]
a = gets.strip()
puts "you said " + a
