require 'test_helper'
require './lib/board'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new("Easy")
  end

  def test_initialize
    assert @board
    assert_equal [4,4], @board.size
    assert_equal 2, @board.p1_ship_count
    assert_equal 2, @board.p2_ship_count
  end

  def test_set_board
    @board.set_board("Intermediate")

    assert_equal [8,8], @board.size
    assert_equal 3, @board.p1_ship_count
    assert_equal 3, @board.p2_ship_count
  end

  def test_set_board_invalid
    assert_raises ArgumentError do
      @board.set_board("Hard")
    end
  end


end
