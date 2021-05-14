require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase

  test "creating a Game" do
    skip
    visit games_url
    click_on "New Game"

    fill_in "Show", with: @game.show
    click_on "Create Game"

    assert_text "Game was successfully created"
    click_on "Back"
  end

end
