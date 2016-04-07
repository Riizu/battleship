require './test/test_helper'
require './lib/game'
require './lib/player'
require './lib/ai'
require './lib/input_handler'
require './lib/display_handler'

class GameTest < Minitest::Test
  def setup
    @game = Game.new("Beginner")
    @input_handler = InputHandler.new
    @display_handler = DisplayHandler.new
  end

  def test_initialize
    assert @game
    refute @running
    assert_equal Player, @game.p1.class
    assert_equal Ai, @game.p2.class
    assert_equal Board, @game.board.class
  end

  def test_start
    
    @game.start(@input_handler, @display_handler)

    assert @game
  end

end
