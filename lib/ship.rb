class Ship
  attr_reader :size, :position, :health

  def initialize(size, *position)
    @size = size
    @position = position
    @health = size
    @sunk = false
  end

  def set_position(*position)
    @position = position
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
