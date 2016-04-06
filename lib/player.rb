require './lib/guess'
require './lib/ship'

class Player
  attr_accessor :guess_history, :owned_ships

  def initialize
    @guess_history = []
    @owned_ships = []
  end

  def make_guess(guess)
    guess = Guess.new(self, guess)
    if !guess.parsed_guess.nil?
      @guess_history << guess
    else
      return nil
    end
  end

  def place_ship(board, size, positions)
    ship = Ship.new(self, board, size, positions)
    if !ship.position.nil?
      @owned_ships << ship
    else
      return nil
    end
  end
end
