class Board
  attr_reader :size, :p1_ship_count, :p2_ship_count

  def initialize(difficulty)
    @board = []
    set_size(difficulty)
  end

  def set_size(difficulty)
    if difficulty == "Beginner"
      @size = [4,4]
      @p1_ship_count = 2
      @p2_ship_count = 2
      generate(4,4)
    elsif difficulty == "Intermediate"
      @size = [8,8]
      @p1_ship_count = 3
      @p2_ship_count = 3
      generate(8,8)
    elsif difficulty == "Advanced"
      @size = [12,12]
      @p1_ship_count = 4
      @p2_ship_count = 4
      generate(12,12)
    else
      raise ArgumentError
    end
  end

  def generate(x, y)
    x.times do |i|
      @board << []
      y.times do |inner_i|
        @board[i] << [inner_i]
      end
    end
  end

  def valid_position(position)
    position.length.times do |i|
      if !position[i+1].nil?
        if position[i][1] + 2 == position[i+1][1]
          return false
        elsif position[i][0] + 2 == position[i+1][0]
          return false
        elsif position[i][0] < 0 || position[i][0] == @size[0]
          return false
        elsif position[i][1] < 0 || position[i][1] == @size[1]
          return false
        elsif position[i+1][0] < 0 || position[i+1][0] == @size[0]
          return false
        elsif position[i+1][1] < 0 || position[i+1][1] == @size[1]
          return false
        end
      end
    end
    return true
  end

end
