require './interface'
require './players'

class Game

  def start_new_game
    @player1 = Players.new
    @player2 = Players.new
    @player1.ask_for_nameX
    @player2.ask_for_nameO
    @board = Board.new
    4.times do
      one_turn("X")
      one_turn("O")
    end
    one_turn ("X")
    even
  end

  def one_turn symbol
    @board.display
    @player1.choose_box (symbol)
    @board.setting_position (symbol)
    @board.check_for_victory (symbol)
  end

  def even
    @board.display
    puts "\nNo one wins... Sorry. Play again ?"
    exit
  end

end

game = Game.new
game.start_new_game
