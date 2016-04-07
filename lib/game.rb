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

  def start(input_handler)
    @running = true
    first_run = true

    while @running
      if first_run
        #display start_game info
        p1_seed_board(input_handler)
        #p2_seed_board(input_handler)
        #display board
        first_run = false
        @running = false
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

  def p1_seed_board(input_handler)
    if @difficulty == "Beginner"
      get_beginner_boats(input_handler)
    elsif @difficulty == "Intermediate"
      get_intermediate_boats(input_handler)
    elsif @difficulty == "Advanced"
      get_advanced_boats(input_handler)
    end
  end

  def p2_seed_board(input_handler)

  end

  def get_beginner_boats(input_handler)
    current_boat_size = 3
    positions = []
    while current_boat_size >= 2
      while !@board.valid_position(positions)
        print "please enter coordinates for the #{current_boat_size}-unit ship: "
        positions = input_handler.get_coordinates
        puts positions.to_s
      end
      puts "placing!"
      @p1.place_ship(@board, current_boat_size, positions)
      current_boat_size -= 1
      positions = []
    end
  end

  def get_intermediate_boats(input_handler)
    current_boat_size = 4
    positions = []
    while current_boat_size >= 2
      until @board.valid_position(positions)
        positions = input_handler.get_coordinates
      end
      @p1.place_ship(@board, current_boat_size, positions)
      current_boat_size -= 1
    end
  end

  def get_advanced_boats(input_handler)
    current_boat_size = 5
    positions = []
    while current_boat_size >= 2
      until @board.valid_position(positions)
        positions = input_handler.get_coordinates
      end
      @p1.place_ship(@board, current_boat_size, positions)
      current_boat_size -= 1
    end
  end
end
