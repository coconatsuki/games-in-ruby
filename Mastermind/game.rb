require './player'
require './computer_setter'

class Game

  def initialize
    @computer_setter = Computer_setter.new
    @text = Text.new
  end

  def start_new_game
    @text.ask_for_name
    @text.explanation
    @computer_setter.create_code
    one_guessing_turn
  end

  def one_guessing_turn
    @text.colors
    if @computer_setter.take_a_guess == true
      @text.winner
      exit
    else
      one_guessing_turn
    end
  end


end

game = Game.new

game.start_new_game
