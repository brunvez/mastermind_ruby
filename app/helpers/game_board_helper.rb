module GameBoardHelper
  def feedback_pin_css_class(pin_type)
    {
      correct_color: 'pin--correct-color',
      correct_position: 'pin--correct-position'
    }[pin_type]
  end

  def game_status(game)
    return 'Won' if game.game_won?
    return 'Lost' if game.rounds_are_over?

    'In Progress'
  end
end
