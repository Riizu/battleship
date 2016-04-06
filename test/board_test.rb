require './test/test_helper'
require './lib/board'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new("Beginner")
  end

  def test_initialize
    assert @board
    assert_equal [4, 4], @board.size
    assert_equal 2, @board.p1_ship_count
    assert_equal 2, @board.p2_ship_count
  end

  def test_set_size_beginner
    @board.set_size("Beginner")

    assert_equal [4, 4], @board.size
    assert_equal 2, @board.p1_ship_count
    assert_equal 2, @board.p2_ship_count
  end

  def test_set_size_intermediate
    @board.set_size("Intermediate")

    assert_equal [8, 8], @board.size
    assert_equal 3, @board.p1_ship_count
    assert_equal 3, @board.p2_ship_count
  end

  def test_set_size_advanced
    @board.set_size("Advanced")

    assert_equal [12, 12], @board.size
    assert_equal 4, @board.p1_ship_count
    assert_equal 4, @board.p2_ship_count
  end

  def test_set_board_invalid
    assert_raises ArgumentError do
      @board.set_size("Hard")
    end
  end

  def test_valid_position

    assert @board.valid_position([[0,0], [0,1]])
    assert @board.valid_position([[0,0], [0,1], [0,2]])
    assert @board.valid_position([[0,0], [1,0]])
    assert @board.valid_position([[0,0], [1,0], [2,0]])
  end

  def test_invalid_position_adjacent_row
    refute @board.valid_position([[0,0], [2,0]])
    refute @board.valid_position([[0,0], [1, 0], [3, 0]])
    refute @board.valid_position([[0,0], [2,2], [3, 0]])
  end

  def test_invalid_position_adjacent_column
    refute @board.valid_position([[0,0], [0,2]])
    refute @board.valid_position([[0,0], [0,1], [0, 3]])
    refute @board.valid_position([[0,0], [0,2], [0, 3]])
  end

  def test_invalid_position_out_of_bounds_row

    refute @board.valid_position([[-1,0], [0,0]])
    refute @board.valid_position([[4,0], [3,0]])
  end

  def test_invalid_position_out_of_bounds_column
    refute @board.valid_position([[0,0], [0,-1]])
    refute @board.valid_position([[0,3], [0,4]])
  end
end
