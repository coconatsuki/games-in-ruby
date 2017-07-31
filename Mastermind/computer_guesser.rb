class Computer_guesser

  def initialize
    @colors_letters = ['Y', 'G', 'B', 'O', 'W', 'P', 'R']
    @old_guess = []
    @new_guess = Array.new(5)
    @matching_colors_array
    @perfect_match_array
  end

  def colors_to_s(array)
    array_to_s = array.map do |el|
      case el
        when 'Y' then 'Yellow'
        when 'G' then 'Green'
        when 'B' then 'Blue'
        when 'O' then 'Orange'
        when 'W' then 'White'
        when 'P' then 'Purple'
        when 'R' then 'Rose'
      end
    end
    array_to_s.join(', ')
  end

  def first_guess
    @old_guess = @colors_letters.sample(5)
    p "==> #{@old_guess.join(' ')} (#{colors_to_s(@old_guess)})"
  end


  def perfect_match
    perfect_match_input = gets.chomp.upcase
    if victory?(perfect_match_input)
      return false
    else
      @perfect_match_array = perfect_match_input.split
      unless valid?(@perfect_match_array)
        puts "You made a mistake. Please write the FIRST LETTER of the colors, or 0."
        perfect_match
      end
      new_guess_with_perfect_match(perfect_match_input)
    end
  end

  def matching_colors
    matching_colors_input = gets.chomp.upcase
    @matching_colors_array = matching_colors_input.split
    unless valid?(@matching_colors_array)
      puts "You made a mistake. Please write the FIRST LETTER of the colors (like 'Y W'), or 0."
      matching_colors
    end
    new_guess_with_matching_colors(matching_colors_input)
  end

  def new_guess_with_perfect_match(input)
    unless input == '0'
      @perfect_match_array.each do |el|
        @new_guess[@old_guess.index(el)] = el
      end
    end
      p @new_guess
  end

  def new_guess_with_matching_colors(input)
    unless input == '0'
      new_sample = @colors_letters.reject do |color|
        @matching_colors_array.include?(color) || @new_guess.include?(color)
      end.sample(5 - @perfect_match_array.size - @matching_colors_array.size)
    end
    @matching_colors_array.each do |el|
      new_sample << el
    end
    building_new_guess(new_sample)
  end

  def building_new_guess(sample)
    sample.shuffle!
    @new_guess.map! do|el|
      if el == nil
        el = sample.pop
      else
        el
      end
    end
    puts "---------------------------"
    p "This is my new guess ! ==> #{@new_guess.join(', ')}"
    @old_guess = @new_guess
    @new_guess = Array.new(5)
  end


  def valid?(try)
    try.each do |el|
      unless @colors_letters.include?(el) || el == '0'
        false
        break
      end
    end
  end

  def victory?(input)
    if input == 'ALL'
      return true
    else
      return false
    end
  end

end
