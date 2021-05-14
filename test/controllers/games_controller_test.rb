require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should show game" do
    skip
    get game_url(@game)
    assert_response :success
  end
end
