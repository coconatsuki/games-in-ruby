class Text

  def initialize
    @name = ''
  end

  def ask_for_name
    puts "What's your name ?"
    puts "---------------------------"
    @name = gets.chomp.capitalize
  end

  def explanation
    puts "---------------------------"
    puts "Hello, #{@name} ! I just chose 5 pegs among 8 colors, and placed them in a specific order."
    puts "\You'll have 12 TURNS to guess, and I'll tell you each time how close you're."
    puts "\nWill you be smart enough to win against me ?"
    puts "---------------------------"
  end

  def colors
    puts "Choose among those 8 colors : yellow, green, blue, orange, white, purple, rose."
    puts "=====> Write the first letters of 5 of them, as in the exemple : G O P R Y"
    puts "\n"
  end

  def winner
    puts "\nArrgggh, You BEAT me !!"
  end

end
