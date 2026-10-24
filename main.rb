require "colorize"
require "tty-prompt"
require_relative "lib/game_round"
require_relative "lib/tty_prompt_wrapper"
require_relative "lib/cpu_secret"
require_relative "lib/player_input"
require_relative "lib/game_verdict"

prompt = TTYPromptWrapper.new
game_round = GameRound.new
cpu_secret = CPUSecret.new
player_input = PlayerInput.new
game_verdict = GameVerdict.new

puts "PLAY MASTERMIND"
selected_mode = prompt.select_mode(
  question: "Choose game mode:",
  choices: ["Play as codebreaker", "Play as codemaker"]
)

def play_codebreaker_mode(game_round:, cpu_secret:, player_input:, game_verdict:)
  cpu_secret.generate_secret_code

  while game_round.current_round.positive?
    game_round.print_current_round
    game_round.print_round_start_instruction
    player_input.request_input
    game_verdict.judge(secret_code: cpu_secret.secret_code, input: player_input.input)

    if game_verdict.final_verdict == "correct"
      puts "You got the secret code! You win!"
      return
    else
      game_round.next_round
      next
    end
  end
  puts "You couldn't guess the secret code! The computer wins!\nThe secret code was #{cpu_secret.secret_code.join}"
end

if selected_mode == "Play as codebreaker"
  play_codebreaker_mode(
    game_round: game_round,
    cpu_secret: cpu_secret,
    player_input: player_input,
    game_verdict: game_verdict
  )
end
