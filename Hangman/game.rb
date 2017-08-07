require './text'
require './system'

class Game

  def initialize
    @system = System.new
    @count = 0
  end

  def start_game
    Text.explanation
    new_word = @system.generate_word
    play(new_word)
  end

  def play(new_word)
    while @count < 12 && !victory?(new_word)
      one_turn(new_word)
    end
    end_of_game(new_word)
    exit
  end

  def one_turn(new_word)
    counter
    Text.choose_a_letter_message
    letter = @system.choose_a_letter
    check_letter(letter, new_word)
    @system.display_word(new_word)
  end

  def counter
    @count += 1
    Text.counter(@count)
  end

  def check_letter(letter, new_word)
    if @system.present_in_the_word?(letter, new_word)
      @system.change_display(letter, new_word)
    else
      Text.letter_not_included_message
    end
  end

  def end_of_game(new_word)
    if victory?(new_word)
      Text.victory_message
    else
      Text.game_over_message
    end
  end

  def victory?(new_word)
    @system.victory?(new_word)
  end

  def save_game

  end

  def load_game

  end

end

game = Game.new

game.start_game
