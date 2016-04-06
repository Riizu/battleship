class Board
  attr_reader :size, :p1_ship_count, :p2_ship_count

  def initialize(difficulty)
    set_board(difficulty)
  end

  def set_board(difficulty)
    if difficulty == "Easy"
      @size = [4,4]
      @p1_ship_count = 2
      @p2_ship_count = 2
    elsif difficulty == "Intermediate"
      @size = [8,8]
      @p1_ship_count = 3
      @p2_ship_count = 3
    elsif difficulty == "Advanced"
      @size = [12,12]
      @p1_ship_count = 4
      @p2_ship_count = 4
    else
      raise ArgumentError
    end
  end

end
