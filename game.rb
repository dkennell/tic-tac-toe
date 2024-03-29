require 'paint'
require 'byebug'
require './lib/game_engine'
require './lib/token_config'

include GameEngine
include TokenConfig

welcome_player()
print_instructions
print_example_board
ask_player_for_token_choice()
token = get_player_token_choice()
play_game(token)
