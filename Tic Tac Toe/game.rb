require './board'
require './players'

class Game

  def start_new_game
    @player1 = Players.new('X')
    @player2 = Players.new('O')
    @player1.ask_for_name
    @player2.ask_for_name
    @board = Board.new
    4.times do
      one_turn(@player1)
      one_turn(@player2)
    end
    one_turn(@player1)
    even
  end

  def one_turn(player)
    @board.display
    player.choose_box_message
    @board.ask_for_next_position(player.symbol)
    victory?(player)
  end

  def victory?(player)
    if @board.victory_conditions(player.symbol)
      @board.display
      player.victory_message
      exit
    end
  end

  def even
    @board.display
    puts "\nNo one wins... Sorry. Play again ?"
    exit
  end
end

game = Game.new
game.start_new_game
