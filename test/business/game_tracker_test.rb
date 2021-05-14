require 'minitest/autorun'

class GameTrackerTest < MiniTest::Test
  def test_makes_guesses_and_returns_feedback
    tracker = GameTracker.start_game(secret_code_colors: %w[red blue green cyan])

    feedback = tracker.make_guess(%w[red green violet cyan])

    assert feedback.correct_positions == 2
    assert feedback.correct_colors == 1
  end

  def test_invalidates_guesses_when_the_game_has_been_won
    tracker = GameTracker.start_game(secret_code_colors: %w[red blue green cyan])

    tracker.make_guess(%w[red green violet cyan])
    tracker.make_guess(%w[red blue green cyan])

    assert tracker.game_won?
    assert_raises(GameOverError) do
      tracker.make_guess(%w[red green violet cyan])
    end
  end

  def test_invalidates_guesses_when_the_game_has_no_more_rounds
    tracker = GameTracker.start_game(secret_code_colors: %w[red blue green cyan])

    GameTracker::MAX_ROUNDS.times do
      tracker.make_guess(%w[red green violet cyan])
    end

    assert_raises(GameOverError) do
      tracker.make_guess(%w[red green violet cyan])
    end
  end

  def test_knows_when_the_game_has_been_won
    tracker = GameTracker.start_game(secret_code_colors: %w[red blue green cyan])

    tracker.make_guess(%w[red green violet cyan])
    tracker.make_guess(%w[red blue green cyan])

    assert tracker.game_won?
  end

  def test_knows_when_the_game_has_not_been_won
    tracker = GameTracker.start_game(secret_code_colors: %w[red blue green cyan])

    tracker.make_guess(%w[red green violet cyan])

    refute tracker.game_won?
  end

  def test_rounds_left
    tracker = GameTracker.start_game(secret_code_colors: %w[red blue green cyan])

    tracker.make_guess(%w[red green violet cyan])
    tracker.make_guess(%w[red yellow violet cyan])

    assert tracker.rounds_left == 8
  end
end
