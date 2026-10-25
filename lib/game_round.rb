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

  def print_codebreaker_start_info
    puts "Guess the computer's four digit secret code!\nEach digit only goes up to the number 6\n"
    print "Input your guess: ".colorize(:yellow)
  end

  def print_codemaker_start_info
    puts "\nCreate a four digit secret code for the computer to find!\nEach digit only goes up to the number 6\n"
    print "Input your secret code: ".colorize(:yellow)
  end
end
