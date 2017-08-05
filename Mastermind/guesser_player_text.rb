class GuesserPlayerText
  attr_reader :name

  def initialize
    @name = ''
  end

  def ask_for_name
    puts "What's your name ?"
    puts puts '---------------------------'
    @name = gets.chomp.capitalize
  end

  def choose_game_mode
    puts '---------------------------'
    puts "\nSo, #{@name}, would you rather 1.be challenged or 2. challenge me ?"
    puts 'Answer with 1 or 2.'
    choice = gets.chomp
    unless choice == '1' || choice == '2'
      puts "\nI didn't understand. Please answer with 1 or 2."
      choose_game_mode
    end
    choice
  end

  def explanation
    puts '---------------------------'
    puts "Ok, #{@name} ! I just chose 5 pegs among 8 colors, and placed them in a specific order."
    puts "\You'll have 12 TURNS to guess."
    puts "\nWill you be smart enough to win against me ?"
    puts '---------------------------'
  end

  def colors
    puts 'Choose among those 8 colors : yellow, green, blue, orange, white, purple, rose.'
    puts '=====> Write the first letters of 5 of them, as in the exemple : G O P R Y'
    puts "\n"
  end

  def winner
    puts "\nArrgggh, You BEAT me !!"
  end
end
