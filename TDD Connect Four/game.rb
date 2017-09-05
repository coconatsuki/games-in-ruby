require './board'
require './player'
require './ui'

class Game
  attr_accessor :board, :player1, :player2

  def initialize
    @board = Board.new
    @symbol_1 = '☀'
    @symbol_2 = '★'
  end

  def launch_game
    game
    end_game
    exit_now
  end

  def game
    while !(victory? || game_over?)
      one_turn(@symbol_1)
      one_turn(@symbol_2) if !(victory? || game_over?)
    end
  end

  def end_game
    if symbol = victory?
      Ui.board_display(@board)
      Ui.victory_message(symbol)
    end
    Ui.game_over_message if game_over?
    end

    def one_turn(symbol)
      Ui.board_display(@board)
      column_number = Ui.choose_column(symbol)
      @board.play(column_number, symbol)
    end

  def victory?
    @board.victory?
  end

  def game_over?
    @board.full?
  end

  def exit_now
    exit
  end
end
