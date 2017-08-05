class ComputerChallenger
  def initialize
    @colors_letters = %w[Y G B O W P R]
    @code = []
  end

  def create_code
    5.times do
      @code = @colors_letters.sample(5)
    end
  end

  def take_a_guess
    try = gets.chomp.split
    if valid?(try)
      evaluation(try)
    else
      puts 'There was a mistake. Check the exemple, and please try again.'
      take_a_guess
    end
  end

  def evaluation(try)
    eval = { perfect: 0, good_color: 0 }
    try.each.with_index do |el, i|
      if @code.include? el
        if i == @code.index(el)
          eval[:perfect] += 1
        else
          eval[:good_color] += 1
        end
      end
    end
    eval_results(eval)
  end

  def eval_results(eval)
    print "\n#{@code}"
    puts "\n==> #{eval[:perfect]} colors are correct and in the good position !"
    puts "==> #{eval[:good_color]} colors are correct but in the wrong position."
    if eval[:perfect] == 5
      true
    else
      false
      puts "\nYou can try again :)"
      puts '---------------------------'
    end
  end

  def valid?(try)
    try.each do |el| # .all?
      unless @colors_letters.include?(el) && try.size == 5
        false
        break
      end
    end
  end
end
