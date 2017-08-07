class System

  attr_accessor :word_to_display, :used_letters

  def initialize
    @word_to_display = []
    @used_letters = []
  end

  def generate_word
    dico_words = File.open('dico.txt', 'r').readlines
    new_word = dico_words.select { |el| el.length >= 5 && el.length <= 12 }.sample.chomp.upcase
    @word_to_display = Array.new(new_word.chomp.length)
    puts new_word if ENV['DEBUG'] == '1'
    new_word
  end

  def display_word
    w = @word_to_display.map do |letter|
      letter.nil? ? ' _ ' : letter
    end
    puts "This is the word : '#{w.join(" ")}'"
  end

  def choose_a_letter
    letter = gets.chomp.upcase
    while !(valid?(letter) && available?(letter))
      Text.error_message_1 unless valid?(letter)
      Text.error_message_2(@used_letters) unless available?(letter)
      letter = gets.chomp.upcase
    end
    @used_letters << letter
    letter
  end

  def valid?(letter)
    letter =~ /^[A-Z]$/ || letter == 'SAVE'
  end

  def available?(letter)
    !@used_letters.include?(letter)
  end

  def present_in_the_word?(letter, new_word)
    new_word.include?(letter)
  end

  def change_display(letter, new_word)
    new_word_array = new_word.chars
    new_word_array.each_with_index do |el, i|
      if el == letter
        @word_to_display[i] = el
      end
    end
  end

  def victory?(new_word)
    new_word.chars == @word_to_display
  end
end
