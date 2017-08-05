class System

  def initialize
    @word_to_display = []
    @used_letters =[]
  end

  def generate_word
    dico_words = File.open('dico.txt', 'r').readlines
    new_word = dico_words.select { |el| el.length >= 5 && el.length <= 12 }.sample.upcase
    @word_to_display = Array.new(new_word.length - 2)
    puts new_word
    new_word
  end

  def display_word
    w = @word_to_display.map do |letter|
      letter.nil? ? ' _ ' : letter
    end
    print "\nThis is the word : #{w.join(" ")}"
  end

  def choose_a_letter
    letter = gets.chomp.upcase
    error_message_1 unless valid?(letter)
    error_message_2 unless available?(letter)
    @used_letters << letter
    letter
  end

  def valid?(letter)
    letter =~ /[A-Z]/
  end

  def available?(letter)
    !@used_letters.include?(letter)
  end

  def error_message_1
    puts "You made a mistake. Please try again!"
    choose_a_letter
  end

  def error_message_2
    puts "You made a mistake. Please write a letter and make sure you haven't used yet."
    unless @used_letters.empty?
      puts "These are the letters you used so far : #{@used_letters.join(', ')}"
    end
    choose_a_letter
  end

  def present_in_the_word?(letter, new_word)
    new_word.include?(letter)
  end

  def change_display(letter, new_word)
    new_word_array = new_word.split(//)
    new_word_array.each.with_index do |el, i|
      if el == letter
        @word_to_display[i] = el
      end
    end
  end

  def victory?(new_word)
    new_word.split == @word_to_display
  end


end
