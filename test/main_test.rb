require 'test_helper'
require './lib/main'

class MainTest < MiniTest::Test
  def test_main_exists
    main = Main.new

    assert Main
  end
end
