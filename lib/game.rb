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
    @max_ship_size = get_max_ship_size
  end

  def start(input_handler)
    @running = true
    first_run = true

    while @running
      if first_run
        #display start_game info
        p2_seed_board(input_handler, @max_ship_size)
        p1_seed_board(input_handler, @max_ship_size)
        #display board
        first_run = false
        @running = false
      end
      input = input_handler.get_input
      update(input)
      input = @p2.generate_guess
      update(input)
      #display Board
      #check for win
    end
  end

  def update(input)

  end

  def get_max_ship_size
    if @difficulty == "Beginner"
      3
    elsif @difficulty == "Intermediate"
      4
    elsif @difficulty == "Advanced"
      5
    end
  end

  def p1_seed_board(input_handler, max_ship_size)
    current_boat_size = max_ship_size
    positions = []
    while current_boat_size >= 2
      while !@board.valid_position(positions)
        print "please enter coordinates for the #{current_boat_size}-unit ship: "
        positions = input_handler.get_coordinates
        puts positions.to_s
      end
      @p1.place_ship(@board, current_boat_size, positions)
      current_boat_size -= 1
      positions = []
    end
  end

  def p2_seed_board(input_handler, max_ship_size)
    current_boat_size = max_ship_size
    positions = []
    while current_boat_size >= 2
      while !@board.valid_position(positions)
        positions = @p2.generate_positions(@board, current_boat_size)
      end
      @p2.place_ship(@board, current_boat_size, positions)
      current_boat_size -= 1
      puts current_boat_size
      positions = []
    end
  end
end
