class ChallengingPlayerText
  def initialize
    @name = ''
  end

  def explanation(name)
    @name = name
    puts '---------------------------'
    puts "So #{@name}, you want to challenge me ? Perfect. These are the rules :"
    puts "\nChoose 5 colors among those 8 (yellow, green, blue, orange, white, purple, rose)"
    puts 'And write them somwhere (on a paper...) in a specific order.'
    puts "\n===> Be careful : NONE of your colors should be the same (because I'm a bit dumb...)"
    puts "\nPush ENTER when ready !"
    gets
    puts '---------------------------'
  end

  def start
    puts '---------------------------'
    puts 'Ok, I made a first guess !'
    puts "\n"
  end

  def perfect_match
    puts "\n1. Please tell me which colors are correct AND in the good position."
    puts "\n==> Be careful, just write the FIRST LETTER of each color separated with a space, like that : 'Y W'"
    puts "If NONE, just write '0'. If all, write 'ALL'."
  end

  def matching_colors
    puts '---------------------------'
    puts "\n2. Now, please write which colors are correct BUT in the wrong position."
    puts "\n(just write the FIRST LETTER of each color, like that : 'Y W')"
    puts 'If none, just write 0.'
  end

  def victory_text
    puts '---------------------------'
    puts "OOH YEAAAAH, I WOOOON, AHAHAHA ! I'm so great."
  end
end
