class Board
  attr_reader :size, :p1_ship_count, :p2_ship_count, :board

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
        @board[i] << "~"
      end
    end
  end

  def add(object, positions)
    positions.length.times do |i|
      @board.length.times do |x|
        if x == positions[i][0]
          @board[x].length.times do |y|
            if y == positions[i][1]
              if object.class == Guess
                @board[x][y] = object.type
              else
                @board[x][y] = object #update to set hit or miss!!
              end
            end
          end
        end
      end
    end
  end

    def valid_position(position)
      position.length.times do |i|
        current = i
        next_value = i + 1
        if !position[next_value].nil?
          if !adjacenct?(position, current, next_value)
            return false
          elsif !in_bounds?(position, current, next_value)
            return false
          elsif occupied?(position[current][0], position[current][1])
            return false
          end
        end
      end
      return true
    end

    def adjacenct?(position, current, next_value)
      if position[current][1] + 2 == position[next_value][1]
        return false
      elsif position[current][0] + 2 == position[next_value][0]
        return false
      else
        return true
      end
    end

    def in_bounds?(position, current, next_value)
      if position[current][0] < 0 || position[current][0] == @size[0]
        return false
      elsif position[current][1] < 0 || position[current][1] == @size[1]
        return false
      elsif position[next_value][0] < 0 || position[next_value][0] == @size[0]
        return false
      elsif position[next_value][1] < 0 || position[next_value][1] == @size[1]
        return false
      else
        return true
      end
    end

    def occupied?(x, y)
      if @board[x][y].class == Ship
        return true
      else
        return false
      end
    end

  end
