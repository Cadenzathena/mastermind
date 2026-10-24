require "colorize"
require "tty-prompt"
require_relative "lib/game_round"
require_relative "lib/tty_prompt_wrapper"
require_relative "lib/cpu_secret"
require_relative "lib/player_input"
# debugger
prompt = TTYPromptWrapper.new

puts "PLAY MASTERMIND"
selected_mode = prompt.select_mode(
  question: "Choose game mode:",
  choices: ["Play as codebreaker", "Play as codemaker"]
)

def play_codebreaker_mode
  game_round = GameRound.new
  cpu_secret = CPUSecret.new
  player_input = PlayerInput.new

  game_round.print_current_round
  game_round.print_round_start_instruction
  cpu_secret.generate_secret_code
  player_input.request_input
  puts "ah"
end

play_codebreaker_mode if selected_mode == "Play as codebreaker"
