require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit games_url
  #
  #   assert_selector "h1", text: "Game"
  # end

  test "going to /new gives us a random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "td", count: 10
  end

  test "one letter consonant word gives us not a English word" do
    visit new_url
    fill_in "word-input", with: "v"
    click_on "get score"

    assert_text "Sorry but V does not seem to be a valid English word"
    # assert_text "Sorry but v does not seem to be a valid English word"
  end

  test "random word gives us word not in the grid" do
    visit new_url
    fill_in "word-input", with: "random"
    click_on "get score"

    assert_text "Sorry but RANDOM can't be build out of"
  end
end
