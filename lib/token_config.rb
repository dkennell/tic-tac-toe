module TokenConfig
  def ask_player_for_token_choice
    puts Paint["Would you like to play as X or O? (X plays first)", "#40ff67"]
  end

  def get_player_token_choice
    token = get_user_token_input()
    while !validate_token_choice(token)
      puts "Sorry, that's not a valid token choice."
      token = get_user_token_input()
    end
    return token
  end

  def get_user_token_input
    puts Paint["(Please enter X or O and then hit enter)", "#40ff67"]
    token = gets.strip()
  end

  def validate_token_choice(token)
    ["X", "x", "O", "o"].include?(token)
  end
end
