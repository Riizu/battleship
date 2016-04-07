require './lib/guess'
require './lib/ship'

class Player
  attr_accessor :guess_history, :owned_ships

  def initialize
    @guess_history = []
    @owned_ships = []
  end

  def make_guess(board, guess)
    guess = Guess.new(self, board, guess)
    @guess_history << guess
    board.add(guess, [guess.position])
  end

  def place_ship(board, size, positions)
    ship = Ship.new(self, board, size, positions)
    @owned_ships << ship
    board.add(ship, positions)
  end
end
