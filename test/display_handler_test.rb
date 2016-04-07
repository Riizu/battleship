require './test/test_helper'
require './lib/display_handler'

class DisplayHandlerTest < MiniTest::Test
  def setup
    @display_handler = DisplayHandler.new
    @board = Board.new("Beginner")
  end

  def test_initialize
    assert @display_handler
  end

  def test_display_game_start
    @display_handler.display_game_start
  end

  def test_display_board
    @display_handler.display_board(@board.board)
  end
end
