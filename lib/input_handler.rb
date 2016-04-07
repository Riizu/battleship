class InputHandler
  def initialize
    @valid_inputs = ['p', 'i', 'q','test']
  end

  def get_input
    input = ""
    while !valid_input?(input)
      print "Please enter a command: "
      input = gets.chomp
    end
    input
  end

  def valid_input?(input)
    @valid_inputs.each do |valid_input|
      if input == valid_input
        return true
      end
    end
    return false
  end

  def get_coordinates
    input = gets.chomp.split(" ")
    array_input = input.collect {|element| [element]}
    parse_coordinates(array_input)
  end

  def parse_coordinates(input)
    result = []
    input.each do |current|
      coordinates = []
      coordinate = current[0].split(//, 2)

      letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"]
      numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

      coordinates << letters.find_index {|letter| letter == coordinate[0] }
      coordinates << numbers.find_index {|number| number == coordinate[1].to_i }

      if coordinates[0] != nil && coordinates[1] != nil
         result << coordinates
      end
    end

    return result
  end

end
