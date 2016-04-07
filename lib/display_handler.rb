require './lib/board'

class DisplayHandler
  def display_game_start
    puts "I have laid out my ships on the grid."
    puts "You now need to layout your two ships."
    puts "The first is two units long and the"
    puts "second is three units long."
    puts "The grid has A1 at the top left and D4 at the bottom right."
  end

  def prompt_for_target
    puts "Please enter a target: "
  end

  def display_board(board)
    puts "\n"
    board.length.times do |x|
      board[x].length.times do |y|
        if (board[x][y].class == Guess)
          print board[x][y].type
        else
          print " ~ "
        end
      end
      print "\n"
    end
  end
end
