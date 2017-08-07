require './text'
require './system'
require 'json'
require 'pry'

class Game

  SAVE_FILE = 'save.json'

  attr_accessor :new_word

  def initialize
    @system = System.new
    @count = 0
    @new_word = ''
  end

  def start_game
    Text.explanation
    loaded = load_game?
    @new_word = @system.generate_word unless loaded
    play(loaded)
  end

  def play(loaded)
    if loaded
      @system.display_word
      @count -= 1
    end
    while @count < 12 && !victory?
      one_turn
    end
    end_of_game
    exit
  end

  def one_turn
    counter
    Text.choose_a_letter_message
    letter = @system.choose_a_letter
    save_game?(letter)
    play_letter(letter)
    @system.display_word
  end

  def counter
    @count += 1
    Text.counter(@count)
  end

  def play_letter(letter)
    if @system.present_in_the_word?(letter, new_word)
      @system.change_display(letter, new_word)
    else
      Text.letter_not_included_message
    end
  end

  def end_of_game
    if victory?
      Text.victory_message
    else
      Text.game_over_message
    end
  end

  def victory?
    @system.victory?(new_word)
  end

  def saving
    objects_to_save = { :new_word => @new_word,
                        :word_to_display  => @system.word_to_display,
                        :used_letters  => @system.used_letters,
                        :count  => @count }
    File.open(SAVE_FILE, 'w') do |file|
      JSON.dump(objects_to_save, file)
    end
  end

  def save_game?(answer)
    if answer == 'SAVE'
      saving
      exit
    end
  end

  def load_game?
    Text.load_question
    answer = gets.chomp
    answer == 'load' ? loading : false
  end

  def loading
    loaded_game = File.open(SAVE_FILE, 'r') do |file|
                  JSON.load(file)
                end
    @new_word = loaded_game['new_word']
    @system.word_to_display = loaded_game['word_to_display']
    @system.used_letters =  loaded_game['used_letters']
    @count =  loaded_game['count']
  end

end

game = Game.new

game.start_game
