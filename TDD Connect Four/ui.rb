require './board'

class Ui

  def self.victory_message(symbol)
    puts "VICTORY !! The player with the symbol #{symbol} wins !"
  end

  def self.game_over_message
    puts "The board is full, and no one wins. Sorry... Try again !"
  end

  def self.not_valid_message
    puts "\nI didn't get this. Could you repeat ?"
    puts "You need to write a letter between A and F, and a number between 1 et 6, like that : 'a1'"
  end

  def self.print_non_available_message
    puts '==> Sorry, this box is not available. Please choose an other one !'
  end

  def self.full_column
    puts '\n==> Sorry, this column is full. Please choose an other one.'
  end

  def self.choose_column(symbol)
    puts "\nPlease write a column number (between 1 and 7) for the symbol #{symbol} ."
    num = gets.chomp
    if num =~ /[1-7]/
      num.to_i
    else
      puts "==> Sorry, you made a mistake. Please do it again."
      choose_column(symbol)
    end
  end

    def self.board_display(board)
      5.downto(0) do |i|
        row_string = row_to_s(board.matrix.row(i))
        puts "| #{row_string.join(' | ')} |"
      end
    end

    def self.row_to_s(row)
      row.map do |el|
        el.nil? ? ' ' : el
      end
    end
  end
