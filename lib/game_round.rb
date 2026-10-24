class GameRound
  def initialize
    @current_round = 12
  end

  def print_current_round
    puts "#{@current_round} Guesses left".colorize(:green)
  end

  def next_round
    @current_round -= 1
  end

  def print_round_start_instruction
    puts "
    Guess the computer's four digit secret code!
    Each digit only goes up to the number 6
    "
  end
end
