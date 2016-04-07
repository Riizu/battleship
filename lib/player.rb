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
    if !guess.parsed_guess.nil?
      @guess_history << guess
      board.add(guess, [guess.parsed_guess])
      return nil
    end
  end

  def place_ship(board, size, positions)
    ship = Ship.new(self, board, size, positions)
    if !ship.position.nil?
      @owned_ships << ship
      board.add(ship, positions)
    else
      return nil
    end
  end
end
