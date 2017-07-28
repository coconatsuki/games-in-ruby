class Board

  def initialize
    @boxes = { "A1" => "   ", "A2" => "   ", "A3" => "   ",
      "B1" => "   ", "B2" => "   ", "B3" => "   ",
      "C1" => "   ", "C2" => "   ", "C3" => "   " }
      @used_boxes = []
      @position = ""
    end

    def display
      puts "\n    1   2   3  "
      puts "A |#{ @boxes["A1"] }|#{ @boxes["A2"] }|#{ @boxes["A3"] }|"
      puts "   ------------"
      puts "B |#{ @boxes["B1"] }|#{ @boxes["B2"] }|#{ @boxes["B3"] }|"
      puts "   ------------"
      puts "C |#{ @boxes["C1"] }|#{ @boxes["C2"] }|#{ @boxes["C3"] }|"
    end

    def setting_position (symbol)
      @position = gets.chomp.upcase
      if valid?(@position)
        if available?(@position)
          print_position(symbol)
        else
          setting_position (symbol)
        end
      else
        setting_position (symbol)
      end
    end

    def print_position(symbol)
      @boxes[@position] = " #{symbol} "
    end

    def valid?(x_or_o)
      if @boxes.has_key? x_or_o
        true
      else
        puts "\nI didn't get this. Could you repeat ?"
        puts "You need to write a letter between A and C, and a number between 1 et 3, like that : 'A1'"
        false
      end
    end

    def available?(x_or_o)
      if @used_boxes.include? x_or_o
        puts "Sorry dear, this box is not available. Please choose an other one !"
        false
      else
        @used_boxes << x_or_o
      end
    end

    def check_for_victory (symbol)
      if victory_conditions (symbol)
        display
        puts "\n The player with the #{symbol} wins, congrats !!"
        exit
      end
    end

    def victory_conditions (symbol)
      if @boxes["A1"] == " #{symbol} " && @boxes["A2"]  == " #{symbol} " && @boxes["A3"] == " #{symbol} "
        true
      elsif @boxes["B1"] == " #{symbol} " && @boxes["B2"]  == " #{symbol} " && @boxes["B3"] == " #{symbol} "
        true
      elsif  @boxes["C1"] == " #{symbol} " && @boxes["C2"]  == " #{symbol} " && @boxes["C3"] == " #{symbol} "
        true
      elsif  @boxes["A1"] == " #{symbol} " && @boxes["B1"]  == " #{symbol} " && @boxes["C1"] == " #{symbol} "
        true
      elsif  @boxes["A2"] == " #{symbol} " && @boxes["B2"]  == " #{symbol} " && @boxes["C2"] == " #{symbol} "
        true
      elsif  @boxes["C1"] == " #{symbol} " && @boxes["C2"]  == " #{symbol} " && @boxes["C3"] == " #{symbol} "
        true
      elsif  @boxes["A1"] == " #{symbol} " && @boxes["B2"]  == " #{symbol} " && @boxes["C3"] == " #{symbol} "
        true
      elsif  @boxes["A3"] == " #{symbol} " && @boxes["B2"]  == " #{symbol} " && @boxes["C1"] == " #{symbol} "
        true
      else
        false
      end
    end
  end
