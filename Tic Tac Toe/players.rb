class Players

  attr_accessor :symbol, :name

  def initialize(symbol)
    @name = ''
    @symbol = symbol
  end

  def ask_for_name
    if symbol == 'X'
      puts "\nHello, dear. You have the X ! What's your name, sweety ?"
    else
      puts "\nHey you, you've got the O ! What's your name, love ?"
    end
    @name = gets.chomp
  end

  def choose_box_message
    puts "\n#{name}, choose an avalaible box between A1 and C3 ! (you have the '#{symbol}')\n"
  end

  def victory_message
    puts "\n#{name} wins the game ! Congraaats !"
  end
end
