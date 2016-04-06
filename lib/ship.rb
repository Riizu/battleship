class Ship
  attr_reader :owner, :size, :position, :health

  def initialize(player, board, size, position)
    @size = size
    set_position(board, position)
    @health = size
    @sunk = false
    @owner = player
  end

  def set_position(board, position)
    if board.valid_position(position)
      @position = position
    else
      raise ArgumentError
    end
  end

  def sunk?
    @sunk
  end

  def take_damage
    @health -=1

    if @health == 0
      @sunk = true
    end
  end

end
