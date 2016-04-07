require './test/test_helper'
require './lib/ship'
require './lib/board'

class ShipTest < Minitest::Test
  def setup
    @board = Board.new("Beginner")
    @player = "Change me to a player object!!!!"
    @ship = Ship.new(@player, @board, 2, [[0,0], [1,0]])
  end

  def test_ship_initialize
    expected = [[0,0], [1,0]]

    assert @ship
    assert_equal 2, @ship.size
    assert_equal expected, @ship.position

  end

  def test_set_position
    @ship.set_position(@board, [[0,0], [0,1]])
    expected = [[0,0], [0,1]]

    assert_equal expected, @ship.position
  end

  def test_not_sunk_if_health_greater_than_zero
    refute @ship.sunk?
  end

  def test_health_after_zero_hits
    assert_equal 2, @ship.health
  end

  def test_take_damage
    @ship.take_damage

    assert_equal 1, @ship.health
  end

  def test_dead_after_taking_fatal_damage
    @ship.take_damage
    @ship.take_damage

    assert @ship.sunk?
  end
end
