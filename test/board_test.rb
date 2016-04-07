require './test/test_helper'
require './lib/board'
require './lib/ship'
require './lib/guess'

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

  def test_invalid_position_occupied
    ship = Ship.new("player", @board, 2, [[0,0],[0,1]])
    @board.add(ship,[[0,0],[0,1]])

    refute @board.valid_position([[0,0],[0,1]])
  end

  def test_check_left
    assert_equal [[3,3],[2,3],[1,3]], @board.check_left([3,3], 2)
  end

  def test_check_right
    assert_equal [[0,0],[1,0],[2,0]], @board.check_right([0,0], 2)
  end

  def test_check_up
    assert_equal [[3,3],[3,2],[3,1]], @board.check_up([3,3], 2)
  end

  def test_check_down
    assert_equal [[0,0],[0,1],[0,2]], @board.check_down([0,0], 2)
  end

  def test_check_left_invalid
    refute @board.check_left([0,0], 2)
  end

  def test_check_right_invalid
    refute @board.check_right([3,3], 2)
  end

  def test_check_up_invalid
    refute @board.check_up([0,0], 2)
  end

  def test_check_down_invalid
    refute @board.check_down([3,3], 2)
  end

  def test_add_ship
    ship = Ship.new("player", @board, 2, [[0,0],[0,1]])
    @board.add(ship,[[0,0],[0,1]])

    assert_equal ship, @board.board[0][0]
    assert_equal ship, @board.board[0][1]
  end

  def test_add_guess
    guess = Guess.new("player", @board, "A3")
    @board.add(guess, [[0,2]])

    assert_equal "miss",@board.board[0][2]
  end

  def test_add_guess_hit
    ship = Ship.new("player", @board, 2, [[0,0],[0,1]])

    @board.add(ship,[[0,0],[0,1]])
    @board.add(Guess.new("player", @board, "A1"), [[0,1]])

    assert_equal "hit", @board.board[0][1]
  end
end
