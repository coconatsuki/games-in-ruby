class Text

  def self.explanation
    puts "\nHello, there ! Let's play 'Hangman' together, and see who's the dead man."
    puts "You'll have 10 turns to guess my secret word. Ready to play ?"
    puts '--------------------------'
  end

  def self.choose_a_letter
    puts "\nPlease choose a letter !"
  end

  def self.letter_not_included
    puts "\nThis letter is not included in my secret word. Try again!"
  end

  def self.victory_message
    puts "\n You win !"
  end

  def self.game_over_message
    puts "\n You loose !"
  end
end
