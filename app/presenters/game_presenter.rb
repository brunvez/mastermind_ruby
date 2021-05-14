class GamePresenter
  FEEDBACK_PINS = 4

  GuessPresenter = Struct.new(:feedback, :colors)

  delegate :game_won?, :rounds_left, :rounds_are_over?, to: :@game_tracker
  delegate :colors, to: :secret_code, prefix: true
  delegate_missing_to :@game

  def initialize(game, game_tracker)
    @game = game
    @game_tracker = game_tracker
  end

  def guesses
    @guesses ||= @game.guesses.reverse.map do |guess|
      feedback = Feedback.new(@game, guess).yield_self do |feedback|
        [
          *feedback.correct_colors.times.collect { :correct_color },
         *feedback.correct_positions.times.collect { :correct_position },
         *(FEEDBACK_PINS - feedback.correct_colors - feedback.correct_positions).times.collect { nil }
        ]
      end

      GuessPresenter.new(feedback, guess.colors)
    end
  end

  private

  def secret_code
    @game.secret_code
  end
end
