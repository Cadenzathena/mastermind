# generates the computer's secret code
class Secret
  attr_reader :secret_code

  def initialize
    @secret_code = []
  end

  def generate_secret_code
    4.times do
      @secret_code.push([1, 2, 3, 4, 5, 6].sample)
    end
  end

  def create_secret_code(code:)
    @secret_code = code
  end
end
