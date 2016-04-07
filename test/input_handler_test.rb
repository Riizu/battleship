require './test/test_helper'
require './lib/input_handler'

class InputHanderTest < MiniTest::Test
  def setup
    @input_handler = InputHandler.new
  end

  def test_initialize
    assert @input_handler
  end

  def test_get_input
    
    print "Testing get_input! Enter 'test': "

    result = @input_handler.get_input

    assert_equal "test", result
  end

  def test_valid_input?
    assert @input_handler.valid_input?("q")
  end

  def test_valid_input_invalid
    refute @input_handler.valid_input?("o")
  end

  def test_get_coordinates

    print "Testing get_coordinates! Enter a 'A1 A2': "

    result = @input_handler.get_coordinates

    assert_equal [[0,0],[0,1]], result
  end

  def test_parse_coordinates
    result = @input_handler.parse_coordinates([['A1']])

    assert_equal [[0,0]], result
  end

  def test_parse_coordinates_multiple
    result = @input_handler.parse_coordinates([['A1'],['A2']])

    assert_equal [[0,0],[0,1]], result
  end

  def test_parse_coordinates_invalid
    result = @input_handler.parse_coordinates([['Z23']])

    assert_equal [], result
  end
end
