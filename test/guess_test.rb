require './test/test_helper'
require './lib/guess'

class GuessTest < Minitest::Test
  def setup
    @player = "CHANGE ME"
    @board = Board.new("Beginner")
    @guess = Guess.new(@player, @board, "A1")
  end

  def test_initialize
    assert_equal @player, @guess.guessed_by
    assert_equal "A1", @guess.guess
    assert_equal [0,0], @guess.parsed_guess
  end

  def test_parse
    parsed_guess = @guess.parse(@board, "B3")

    assert_equal [1,2], parsed_guess
  end

  def test_parse_invalid
    parsed_guess = @guess.parse(@board, "Z23")

    assert_equal nil, parsed_guess
  end

end
