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
    unless victory?(new_word) || @count == 10
      @count += 1
      puts '------------------'
      puts "===> Turn #{@count}"
      one_turn(new_word)
    end
    if victory?(new_word)
      Text.victory_message
      exit
    elsif @count == 10
      Text.game_over_message
      exit
    end
  end

  def one_turn(new_word)
    Text.choose_a_letter
    letter = @system.choose_a_letter
    if @system.present_in_the_word?(letter, new_word)
      @system.change_display(letter, new_word)
    else
      Text.letter_not_included
    end
    @system.display_word
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
