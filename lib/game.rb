require './lib/player'
require './lib/ai'
require './lib/board'

class Game
  attr_reader :p1, :p2, :running, :difficulty
  attr_accessor :board

  def initialize(difficulty)
    @difficulty = difficulty
    @p1 = Player.new
    @p2 = Ai.new(difficulty)
    @board = Board.new(difficulty)
    @running = false
  end

  def start
    #@running = true
    first_run = true

    while @running
      if first_run
        #display start_game info
        #p1_seed_board
        #p2_seed_board
        #display board
      end

      #p1 get guess
      #calculate changes
      #p2 get guess
      #calculate changes
      #display Board
      #check for win
    end
  end

  def update

  end

  def p1_seed_board()
    if @difficulty == "Beginner"
      get_beginner_boats
    elsif @difficulty == "Intermediate"
      get_intermediate_boats
    elsif @difficulty == "Advanced"
      get_advanced_boats
    end
  end

  def p2_seed_board

  end

  def get_beginner_boats
    current_boat_size = 3
    positions = []
    while current_boat_size >= 2
      #puts "in get_beginner_boats"
      until @board.valid_position(positions)
        #prompt for positions
      end
      @p1.place_ship(@board, current_boat_size, positions)
      current_boat_size -= 1
    end
  end

  def get_intermediate_boats
    current_boat_size = 4
    positions = []
    while current_boat_size >= 2
      until @board.valid_position(positions)
        #prompt for positions
      end
      @p1.place_ship(@board, current_boat_size, positions)
      current_boat_size -= 1
    end
  end

  def get_advanced_boats
    current_boat_size = 5
    positions = []
    while current_boat_size >= 2
      until @board.valid_position(positions)
        #prompt for positions
      end
      @p1.place_ship(@board, current_boat_size, positions)
      current_boat_size -= 1
    end
  end
end
