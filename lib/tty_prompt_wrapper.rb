# wrapper for the tty-prompt gem and its methods
class TTYPromptWrapper
  def initialize
    @prompt = TTY::Prompt.new
  end

  def select_mode(question:, choices:)
    @prompt.select(question, choices)
  end
end
