require './lib/player'

class Ai < Player
  attr_reader :range

  def initialize(difficulty)
    @letters = ["A", "B", "C", "D", "E", "F", "G", "H",
               "I", "J", "K", "L"]
    @numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    @range = set_range(difficulty)
    @guess_history = []
    @owned_ships = []
  end

  def set_range(difficulty)
    if difficulty == "Beginner"
      range = 4
    elsif difficulty == "Intermediate"
      range = 8
    elsif difficulty == "Advanced"
      range = 12
    end
  end

  def generate_guess
    result = []
    result << rand(@range) << rand(@range)
  end

  def generate_positions(board, size)
    result = []
    while result.length < size
      sub_result = [rand(size),rand(size)]
      if board.check_left(sub_result, size)
        result << sub_result
      elsif board.check_right(sub_result, size)
        result << sub_result
      elsif board.check_up(sub_result, size)
        result << sub_result
      elsif board.check_down(sub_result, size)
        result << sub_result
      end
    end
    result
  end


end
