require './test/test_helper'
require './lib/game'
require './lib/player'
require './lib/ai'

class GameTest < Minitest::Test
  def setup
    @game = Game.new("Beginner")
  end

  def test_initialize
    assert @game
    refute @running
    assert_equal Player, @game.p1.class
    assert_equal Ai, @game.p2.class
    assert_equal Board, @game.board.class
  end

  def test_start
    skip
    @game.start

    assert @game.running
  end

  def test_update
    @game.update
  end
end
