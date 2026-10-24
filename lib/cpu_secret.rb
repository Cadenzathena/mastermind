# generates the computer's secret code
class CPUSecret
  attr_reader :secret_code

  def initialize
    @secret_code = []
  end

  def generate_secret_code
    4.times do
      @secret_code.push([1, 2, 3, 4, 5, 6].sample)
    end
    p @secret_code
  end
end
