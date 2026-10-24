# determines the rounds of mastermind
class GameRound
  attr_reader :current_round

  def initialize
    @current_round = 12
  end

  def print_current_round
    puts "\n#{@current_round} Guesses left".colorize(:green)
  end

  def next_round
    @current_round -= 1
  end

  def print_round_start_instruction
    puts "Guess the computer's four digit secret code!\nEach digit only goes up to the number 6\n"
  end
end
