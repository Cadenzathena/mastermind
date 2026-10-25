# determines if the game has been won by the codebreaker
class GameVerdict
  attr_reader :hints

  def win?(secret_code:, input:)
    if secret_code == input
      true
    else
      true_digits(secret_code, input)
      true_positions(secret_code, input)
      false
    end
  end

  private

  def true_digits(secret_code, input)
    @true_digits_size = 0
    count = input.tally(Hash.new(0)) { |res, acc| acc[res] }
    count.map do |key, value|
      @true_digits_size += value if secret_code.include?(key)
    end
  end

  def true_positions(secret_code, input)
    @true_positions_size = 0
    i = 0
    while i < input.length
      @true_positions_size += 1 if secret_code[i] == input[i]
      i += 1
    end
  end

  public

  def create_hints(input)
    @hints = {
      red: @true_positions_size,
      white: @true_digits_size - @true_positions_size,
      grey: input.length - @true_digits_size
    }
  end

  def print_hints
    puts "#{@hints[:red]} digit(s) are correct and in the right position".colorize(background: :red)
    puts "#{@hints[:white]} digit(s) are correct but in the wrong position".colorize(color: :black, background: :white)
    puts "#{@hints[:grey]} digit(s) are incorrect".colorize(background: :grey)
    puts "\n"
  end
end
