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
    @player.make_guess(@board,[0,0])

    assert_equal [0,0], @player.guess_history[0].position
  end

  def test_place_ship
    @player.place_ship(@board, 2, [[0,0],[0,1]])

    assert_equal Ship, @player.owned_ships[0].class
  end
end
