require 'test_helper'
require './lib/ship'

class ShipTest < Minitest::Test
  def setup
    @ship = Ship.new(2, "A1", "B1")
  end

  def test_ship_initialize
    assert @ship
    assert_equal 2, @ship.size
    assert_equal ["A1", "B1"], @ship.position

  end

  def test_set_position
    @ship.set_position("A1", "A2")

    assert_equal ["A1", "A2"], @ship.position
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
