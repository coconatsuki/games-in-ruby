class Text

  def self.counter(count)
    puts '--------------------------'
    puts "===> Turn #{count}"
    if count == 12
      puts "Be careful, it's your last turn !"
    end
  end

  def self.explanation
    puts "\nHello, there ! Let's play 'Hangman' together, and see who's the dead man."
    puts "You'll have 12 turns to guess my secret word. Ready to play ?"
    puts '--------------------------'
  end

  def self.choose_a_letter_message
    puts "\nPlease choose a letter ! // Or, if you want to save and quit, write 'save'."
  end

  def self.letter_not_included_message
    puts "\nThis letter is not included in my secret word. Try again!"
  end

  def self.victory_message
    puts '--------------------------'
    puts "\n You win !"
  end

  def self.game_over_message
    puts '--------------------------'
    puts "\n Sorry, it was the last turn (12)... GAME OVER ! "
    puts '    ________'
    puts '    |      |'
    puts '    |      O'
    puts '    |    --|--'
    puts '    |     / \ '
    puts '    |'
    puts '---------'
  end

  def self.error_message_1
    puts "You made a mistake. Please try again!"
  end

  def self.error_message_2(used_letters)
    puts "You made a mistake. Please write a letter and make sure you haven't used yet."
    unless used_letters.empty?
      puts "These are the letters you used so far : #{used_letters.join(', ')}"
    end
  end

  def self.save_game_question
    puts '--------------------------'
    puts "Do you want to save the game and quit ? If so, write 'save'. If no, just push enter."
    puts '--------------------------'
  end

  def self.load_question
    puts "Do you want to load a previous game ? If so, write 'load'. Otherwise, just push enter."
  end
end
