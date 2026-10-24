require "colorize"
require "tty-prompt"
require_relative "lib/game_round"
require_relative "lib/tty_prompt_wrapper"
require_relative "lib/cpu_secret"
require_relative "lib/player_input"
require_relative "lib/game_verdict"
# debugger

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
  # 12.times do # rubocop:disable Layout/CommentIndentation
    game_round.print_current_round # rubocop:disable Layout/IndentationWidth
    game_round.print_round_start_instruction
    cpu_secret.generate_secret_code
    player_input.request_input

    judgement = game_verdict.judge(
      secret_code: cpu_secret.secret_code,
      input: player_input.input
    )
  # end
end

if selected_mode == "Play as codebreaker"
  play_codebreaker_mode(
    game_round: game_round,
    cpu_secret: cpu_secret,
    player_input: player_input,
    game_verdict: game_verdict
  )
end
