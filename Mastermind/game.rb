require './guesser_player_text'
require './challenging_player_text'
require './computer_guesser'
require './computer_challenger'

class Game

  def initialize
    @computer_challenger = Computer_challenger.new
    @computer_guesser = Computer_guesser.new
    @guesser_player_text = Guesser_player_text.new
    @challenging_player_text = Challenging_player_text.new
  end

  def start_new_game
    @guesser_player_text.ask_for_name
      if @guesser_player_text.choose_game_mode == "1"
      start_guessing
    else
      start_challenging
    end
  end

  def start_guessing
    @guesser_player_text.explanation
    @computer_challenger.create_code
    one_guessing_turn
  end

  def start_challenging
    @challenging_player_text.explanation(@guesser_player_text.name)
    @challenging_player_text.start
    @computer_guesser.first_guess
    one_challenging_turn
  end

  def one_guessing_turn
    @guesser_player_text.colors
    if @computer_challenger.take_a_guess == true
      @guesser_player_text.winner
      exit
    else
      one_guessing_turn
    end
  end

  def one_challenging_turn
    @challenging_player_text.perfect_match
    if @computer_guesser.perfect_match
      @challenging_player_text.matching_colors
      @computer_guesser.matching_colors
      one_challenging_turn
    else
      victory
    end
  end

  def victory
    @challenging_player_text.victory_text
  end

end

game = Game.new

game.start_new_game
