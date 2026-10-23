class GameRound
  def initialize
    @current_round = 12
  end

  def print_current_round
    puts "#{@current_round} Guesses left"
  end

  def next_round
    @current_round -= 1
  end
end
