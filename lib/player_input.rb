# validates player input
class PlayerInput
  attr_reader :input

  def request_input
    @raw_input = gets.chomp
    input_validation
  end

  private

  def input_validation
    if @raw_input.chars.any? { |character| !%w[1 2 3 4 5 6].include?(character) } ||
       @raw_input.chars.length != 4
      puts "Input a valid four digit number\nEach digit only goes up to the number 6".colorize(:red)
      request_input
    else
      @input = @raw_input.chars.map(&:to_i)
      @input
    end
  end
end
