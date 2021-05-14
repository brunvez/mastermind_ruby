class GuessesController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    tracker = GameTracker.new(game)
    tracker.make_guess(guess_colors)
    redirect_to game
  rescue ActiveRecord::RecordInvalid => e
    redirect_to game, notice: e.record.errors.full_messages.to_sentence
  end

  private

  def guess_colors
    [
      params[:colors]['0'],
      params[:colors]['1'],
      params[:colors]['2'],
      params[:colors]['3'],
    ]
  end
end
