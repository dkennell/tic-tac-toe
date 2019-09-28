require 'paint'
require 'byebug'
require './lib/game_engine'
include GameEngine

welcome_player()
ask_player_for_token_choice()
token = get_player_token_choice()
play_game(token)
