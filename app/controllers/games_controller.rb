class GamesController < ApplicationController
  def index
    @games = Game.order(created_at: :desc).map { |game| GamePresenter.new(game, GameTracker.new(game)) }
  end

  def show
    game = Game.find(params[:id])
    tracker = GameTracker.new(game)
    @game = GamePresenter.new(game, tracker)
  end

  def create
    tracker = GameTracker.start_game

    redirect_to tracker.game
  end
end
