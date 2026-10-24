# validates player input
class PlayerInput
  def request_input
    print "Input your guess: "
    @input = gets.chomp
    input_validation
  end

  def input_validation
    if @input.chars.any? { |character| !%w[1 2 3 4 5 6].include?(character) } ||
       @input.chars.length != 4
      puts "
      Input a valid four digit number
      Each digit only goes up to the number 6
      ".colorize(:red)
      request_input
    end
  end
end
