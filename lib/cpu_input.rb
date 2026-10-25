# Generates possible codes and guesses for the cpu
class CPUInput
  attr_reader :candidate_codes, :guess

  def initialize
    @candidate_codes = []
    @verdict = GameVerdict.new
  end

  def generate_candidates
    i = 400
    while to_septenary(i).join.to_i <= 6666
      if to_septenary(i).include?("0")
        i += 1
        next
      else
        @candidate_codes.push(to_septenary(i).map(&:to_i))
        i += 1
      end
    end
  end

  private

  def to_septenary(num)
    num.to_s(7).chars
  end

  public

  def guess_secret_code
    @guess = @candidate_codes.sample
  end

  def print_guess
    puts @guess.join.to_i
  end

  def reassess_candidates(round_hints:)
    @candidate_codes = @candidate_codes.filter_map do |code|
      @verdict.win?(secret_code: code, input: @guess)
      @verdict.create_hints(@guess)
      code if @verdict.hints == round_hints
    end
  end
end
