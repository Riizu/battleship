class Guess
 attr_reader :guessed_by, :position, :type

 def initialize(player, board, position)
   @guessed_by = player
   @position = position
   @type = get_type(board, position)
 end

 def get_type(board, position)
   if board.occupied?(position[0], position[1])
     @type = "hit"
   else
     @type = "miss"
   end
 end
end
