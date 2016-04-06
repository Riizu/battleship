require './test/test_helper'
require './lib/player'
require './lib/guess'
require './lib/board'
require './lib/ship'

class PlayerTest < Minitest::Test
  def setup
    @player = Player.new
    @board = Board.new("Beginner")
  end

  def test_initialize
    assert @player
    assert_equal [], @player.guess_history
    assert_equal [], @player.owned_ships
  end

  def test_make_guess
    @player.make_guess("A1")

    assert_equal "A1", @player.guess_history[0].guess
  end

  def test_make_guess_invalid
    result = @player.make_guess("Z23")

    assert_equal nil, result
  end

  def test_place_ship
    @player.place_ship(@board, 2, [[0,0],[0,1]])

    assert_equal Ship, @player.owned_ships[0].class
  end

  def test_place_ship_invalid
    @player.place_ship(@board, 2, [[0,0],[0,2]])

    assert_equal nil, @player.owned_ships[0]
  end
end
