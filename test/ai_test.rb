require './test/test_helper'
require './lib/player'
require './lib/ai'
require './lib/board'

class AiTest < Minitest::Test
  def setup
    @ai = Ai.new("Beginner")
    @board = Board.new("Beginner")
  end

  def test_initialize
    assert @ai
    assert_equal 4, @ai.range
    assert_equal [], @ai.guess_history
    assert_equal [], @ai.owned_ships
  end

  def test_generate_guess_beginner
    guess = @ai.generate_guess

    assert guess
  end

  def test_generate_positions_size_2
    positions = @ai.generate_positions(@board,2)

    assert positions
  end

  def test_generate_positions_size_3
    positions = @ai.generate_positions(@board,3)

    assert positions
  end
end
