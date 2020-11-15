class GameTracker
  MAX_ROUNDS = 10

  def self.start_game(secret_code_colors: nil)
    secret_code_colors ||= Game::VALID_COLOR_COMBINATIONS.sample
    game = Game.new
    game.secret_code = SecretCode.new(colors: secret_code_colors)
    game.save!

    new(game)
  end

  def initialize(game)
    @game = game
  end

  def make_guess(colors)
    raise GameOverError, 'The game has been won' if game_won?
    raise GameOverError, 'The game has no more rounds' if rounds_are_over?

    guess = @game.guesses.create!(colors: colors)

    Feedback.new(@game, guess)
  end

  def game_won?
    secret_code = @game.secret_code
    last_guess = @game.guesses.last

    return false if last_guess.nil?

    secret_code.colors == last_guess.colors
  end

  private

  def rounds_are_over?
    @game.guesses.count >= MAX_ROUNDS
  end
end
