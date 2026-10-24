# determines if the game has been won by the codebreaker
class GameVerdict
  attr_reader :final_verdict

  def judge(secret_code:, input:)
    if secret_code == input
      @final_verdict = "correct"
    else
      @true_digits_size = 0
      @true_positions_size = 0
      true_digits(secret_code, input)
      true_positions(secret_code, input)
      print_hints(input)
      @final_verdict = "wrong"
    end
  end

  private

  def true_digits(secret_code, input)
    count = input.tally(Hash.new(0)) { |res, acc| acc[res] }
    count.map do |key, value|
      @true_digits_size += value if secret_code.include?(key)
    end
  end

  def true_positions(secret_code, input)
    i = 0
    while i < input.length
      @true_positions_size += 1 if secret_code[i] == input[i]
      i += 1
    end
  end

  def print_hints(input)
    puts "#{@true_positions_size} digit(s) are correct and in the right position".colorize(background: :red)
    puts "#{@true_digits_size - @true_positions_size} digit(s) are correct but in the wrong position".colorize(
      color: :black, background: :white
    )
    puts "#{input.length - @true_digits_size} digit(s) are incorrect".colorize(background: :grey)
    puts "\n"
  end
end
