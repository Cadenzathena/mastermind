require "colorize"
require "tty-prompt"
require_relative "lib/game_round"
require_relative "lib/tty_prompt_wrapper"
require_relative "lib/secret"
require_relative "lib/player_input"
require_relative "lib/game_verdict"
require_relative "lib/cpu_guess"

prompt = TTYPromptWrapper.new
game_round = GameRound.new
cpu_secret = Secret.new
player_secret = Secret.new
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
    game_round.print_codebreaker_start_info
    player_input.request_input

    case game_verdict.judge(secret_code: cpu_secret.secret_code, input: player_input.input)
    when "correct"
      puts "You got the secret code! You win!"
      return
    when "wrong"
      game_round.next_round
      next
    end
  end
  puts "You couldn't guess the secret code! The computer wins!\nThe secret code was #{cpu_secret.secret_code.join}"
end

def play_codemaker_mode(player_secret:, player_input:, game_round:, game_verdict:)
  cpu_guess = CPUGuess.new
  game_round.print_codemaker_start_info
  player_secret.input_secret_code(player_input.request_input)

  game_round.print_current_round
  puts "The computer is picking a code..."
  sleep 2
  case game_verdict.judge(secret_code: player_secret.secret_code, input: cpu_guess.guess)
  when "correct"
    puts "The computer got the secret code! The computer wins!"
  when "wrong"
    puts "aw shucks!"
  end
end

if selected_mode == "Play as codebreaker"
  play_codebreaker_mode(
    game_round: game_round,
    cpu_secret: cpu_secret,
    player_input: player_input,
    game_verdict: game_verdict
  )
else
  play_codemaker_mode(
    player_secret: player_secret,
    player_input: player_input,
    game_round: game_round,
    game_verdict: game_verdict
  )
end
