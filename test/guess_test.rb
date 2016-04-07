require './test/test_helper'
require './lib/guess'

class GuessTest < Minitest::Test
  def setup
    @player = "CHANGE ME"
    @board = Board.new("Beginner")
    @guess = Guess.new(@player, @board, [0,0])
  end

  def test_initialize
    assert_equal @player, @guess.guessed_by
    assert_equal [0,0], @guess.position
  end
end
