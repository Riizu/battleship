class Guess
 attr_reader :guessed_by, :guess, :parsed_guess, :type

 def initialize(player, guess)
   @guessed_by = player
   @guess = guess
   @parsed_guess = parse(guess)
 end

 def parse(guess)
   guess = guess.split(//, 2)
   result = []
   letters = ["A", "B", "C", "D", "E", "F", "G", "H",
              "I", "J", "K", "L"]
   numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

   result << letters.find_index {|letter| letter == guess[0] }
   result << numbers.find_index {|number| number == guess[1].to_i }
   return result if result[0] != nil
 end
end
