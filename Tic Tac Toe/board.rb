class Board
  def initialize
    @boxes = Hash.new('   ')
    end

    def used_boxes
      @boxes.select do |k, v|
        v != '   '
      end.keys
    end

    def display
      puts "\n    1   2   3  "
      puts "A |#{@boxes['A1']}|#{@boxes['A2']}|#{@boxes['A3']}|"
      puts '   ------------'
      puts "B |#{@boxes['B1']}|#{@boxes['B2']}|#{@boxes['B3']}|"
      puts '   ------------'
      puts "C |#{@boxes['C1']}|#{@boxes['C2']}|#{@boxes['C3']}|"
    end

    def ask_for_next_position(symbol)
      position = gets.chomp.upcase
      while !valid?(position) || !available?(position)
        print_non_valid_message unless valid?(position)
        print_non_available_message unless available?(position)
        position = gets.chomp.upcase
      end
      play(symbol, position)
    end

    def play(symbol, position)
      @boxes[position] = " #{symbol} "
    end

    def valid?(position)
      @boxes.has_key?(position)
    end

    def print_non_valid_message
      puts "\nI didn't get this. Could you repeat ?"
      puts "You need to write a letter between A and C, and a number between 1 et 3, like that : 'A1'"
    end

    def print_non_available_message
      puts 'Sorry dear, this box is not available. Please choose an other one !'
    end

    def available?(position)
      !used_boxes.include?(position)
    end

    def victory_conditions(symbol)
      (@boxes["A1"] == " #{symbol} " && @boxes["A2"]  == " #{symbol} " && @boxes["A3"] == " #{symbol} ") ||
      (@boxes["B1"] == " #{symbol} " && @boxes["B2"]  == " #{symbol} " && @boxes["B3"] == " #{symbol} ") ||
      (@boxes["C1"] == " #{symbol} " && @boxes["C2"]  == " #{symbol} " && @boxes["C3"] == " #{symbol} ") ||
      (@boxes["A1"] == " #{symbol} " && @boxes["B1"]  == " #{symbol} " && @boxes["C1"] == " #{symbol} ") ||
      (@boxes["A2"] == " #{symbol} " && @boxes["B2"]  == " #{symbol} " && @boxes["C2"] == " #{symbol} ") ||
      (@boxes["C1"] == " #{symbol} " && @boxes["C2"]  == " #{symbol} " && @boxes["C3"] == " #{symbol} ") ||
      (@boxes["A1"] == " #{symbol} " && @boxes["B2"]  == " #{symbol} " && @boxes["C3"] == " #{symbol} ") ||
      (@boxes["A3"] == " #{symbol} " && @boxes["B2"]  == " #{symbol} " && @boxes["C1"] == " #{symbol} ")
    end
  end
