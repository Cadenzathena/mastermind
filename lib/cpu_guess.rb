class CPUGuess
  attr_reader :candidate_codes

  def initialize
    @candidate_codes = []
    generate_candidates
  end

  private

  def generate_candidates
    i = 400
    while to_septenary(i) <= 6666
      if to_septenary(i).to_s.chars.include?("0")
        i += 1
        next
      else
        @candidate_codes.push(to_septenary(i))
        i += 1
      end
    end
  end

  def to_septenary(num)
    num.to_s(7).to_i
  end

  public

  def guess
    p(@candidate_codes.sample)
  end
end
