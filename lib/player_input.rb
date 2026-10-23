class PlayerInput
  def get_player_input
    puts "
    Guess the computer's four digit secret code!
    Each digit only goes up to the number 6
    "
    print "Input your guess: "
    @input = gets.chomp
    input_validation
  end

  def input_validation
  end
end
