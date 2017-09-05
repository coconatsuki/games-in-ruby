class Matrix
  attr_accessor :boxes

  def initialize(column, row)
    @boxes = create_box(column, row)
  end

  def []=(column, row, value)
    out_of_range(column, row)
    @boxes[column][row] = value
  end

  def [](column, row)
    out_of_range(column, row)
    @boxes[column][row]
  end

  def col(num)
    @boxes[num]
  end

  def row(num)
    @boxes.map{ |el|  el[num] }
  end

  def diag_r(num)
    col = num
    row = 0
    result = []
    while col < @boxes.size && row < @boxes[0].size
      result << @boxes[col][row]
      col += 1
      row += 1
    end
    result
  end

  def diag_l(num)
    col = num
    row = 0
    result = []
    while col >= 0 && row < @boxes[0].size
      result << @boxes[col][row]
      col -= 1
      row += 1
    end
    result
  end

  def cols
    @boxes
  end

  def rows
    result = []
    @boxes[0].size.times do |i|
      result << row(i)
    end
    result
  end

  def diags
    result = []
    @boxes.size.times do |i|
      result << diag_l(i) << diag_r(i)
    end
    result
  end

  def create_box(column, row)
    b = Array.new(column)
    b.map! do |column|
      Array.new(row)
    end
  end

  def available?(position)
    @boxes[position].any? {|el| el.nil? }
  end

  def play(position, symbol)
    array = @boxes[position]
    index = array.index(nil)
    array[index] = symbol
  end

  def out_of_range(column, row)
    raise "#{column} is out of range" if column < 0 || column >= @boxes.size
    raise "#{row} is out of range" if row < 0 || row >= @boxes[0].size
  end
end
