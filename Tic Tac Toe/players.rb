class Players
  def initialize
    @name = ''
  end

  def ask_for_nameX
    puts "\nHello, dear. You have the X ! What's your name, sweety ?"
    @name = gets.chomp
  end

  def ask_for_nameO
    puts "\nHey you, you've got the O ! What's your name, love ?"
    @name = gets.chomp
  end

  def choose_box(player)
    puts "\n#{@name}, choose an avalaible box between A1 and C3 ! (you have the '#{player}')\n"
  end
end
