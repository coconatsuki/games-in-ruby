class Board
  attr_accessor :boxes

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
      puts "A |#{@boxes['a1']}|#{@boxes['a2']}|#{@boxes['a3']}|"
      puts '   ------------'
      puts "B |#{@boxes['b1']}|#{@boxes['b2']}|#{@boxes['b3']}|"
      puts '   ------------'
      puts "C |#{@boxes['c1']}|#{@boxes['c2']}|#{@boxes['c3']}|"
    end

    def ask_for_next_position(symbol)
      position = gets.chomp.downcase
      while !valid?(position) || !available?(position)
        print_non_valid_message unless valid?(position)
        print_non_available_message unless available?(position)
        position = gets.chomp.downcase
      end
      play(symbol, position)
    end

    def play(symbol, position)
      @boxes[position] = " #{symbol} "
    end

    def valid?(position)
      position =~ /^[a-c][1-3]$/
    end

    def print_non_valid_message
      puts "\nI didn't get this. Could you repeat ?"
      puts "You need to write a letter between A and C, and a number between 1 et 3, like that : 'a1'"
    end

    def print_non_available_message
      puts 'Sorry dear, this box is not available. Please choose an other one !'
    end

    def available?(position)
      !used_boxes.include?(position)
    end

    def victory_conditions(symbol)
      (@boxes["a1"] == " #{symbol} " && @boxes["a2"]  == " #{symbol} " && @boxes["a3"] == " #{symbol} ") ||
      (@boxes["b1"] == " #{symbol} " && @boxes["b2"]  == " #{symbol} " && @boxes["b3"] == " #{symbol} ") ||
      (@boxes["c1"] == " #{symbol} " && @boxes["c2"]  == " #{symbol} " && @boxes["c3"] == " #{symbol} ") ||
      (@boxes["a1"] == " #{symbol} " && @boxes["b1"]  == " #{symbol} " && @boxes["c1"] == " #{symbol} ") ||
      (@boxes["a2"] == " #{symbol} " && @boxes["b2"]  == " #{symbol} " && @boxes["c2"] == " #{symbol} ") ||
      (@boxes["c1"] == " #{symbol} " && @boxes["c2"]  == " #{symbol} " && @boxes["c3"] == " #{symbol} ") ||
      (@boxes["a1"] == " #{symbol} " && @boxes["b2"]  == " #{symbol} " && @boxes["c3"] == " #{symbol} ") ||
      (@boxes["a3"] == " #{symbol} " && @boxes["b2"]  == " #{symbol} " && @boxes["c1"] == " #{symbol} ")
    end
  end
