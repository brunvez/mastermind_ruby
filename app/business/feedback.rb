class Feedback
  attr_reader :correct_colors, :correct_positions

  def initialize(game, guess)
    calculate_feedback(game, guess)
  end

  private

  def calculate_feedback(game, guess)
    secret_code_colors = game.secret_code.colors
    @correct_positions = secret_code_colors.zip(guess.colors).count { |secret_color, guess_color| secret_color == guess_color }
    @correct_colors = (secret_code_colors & guess.colors).count - @correct_positions
  end
end
