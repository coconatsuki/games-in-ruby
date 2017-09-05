require 'pry'
require './matrix'

class Board

  attr_accessor :matrix

  def initialize
    @matrix = Matrix.new(7, 6)
  end

  def valid?(position)
    (1..7).include? position
  end

  def play(position, symbol)
    if available?(position) && valid?(position)
      @matrix.play(position - 1, symbol)
    elsif !available?(position)
      Ui.print_non_available_message
      false
    end
  end

  def available?(column)
    @matrix.available?(column - 1)
  end

  def full?
    @matrix.cols.flatten.none? { |el| el.nil? }
  end

  def victory?
    victory_col = victory_aux_array?(@matrix.cols)
    victory_row = victory_aux_array?(@matrix.rows)
    victory_diag = victory_aux_array?(@matrix.diags)
    victory_col || victory_row || victory_diag
  end

  def victory_aux_array?(array)
    array.map do |arr|
      victory_aux?(arr)
    end.find { |el| el }
  end

  def victory_aux?(array)
    consecutive_symbols = array.each_cons(4).find do |cons|
      !cons.first.nil? && cons.all? { |el| cons[0] == el }
    end
    if consecutive_symbols.nil?
      false
    else
      consecutive_symbols.first
    end
  end
end
