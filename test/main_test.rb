require 'test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/main'

class MainTest < MiniTest::Test
  def test_main_exists
    main = Main.new

    assert Main
  end
end
