require 'colorize'
require_relative './words'

class Game
  attr_reader :wordlist, :solution, :choices
  
  def initialize(wordsize)
    @wordsize = wordsize
    @reference_words = reference_words
    @solution = solution_words.sample
    @choices = ('a'..'z').to_a
  end

  def display_choices
    puts @choices.join(" ").upcase
    puts
  end

  def reduce_choices_by(guess)
    @wordsize.times do |i|
      @choices.delete(guess[i-1])
    end
  end

  def in_word(letter)
    letter.upcase.light_white.on_yellow
  end

  def correct(letter)
    letter.upcase.light_white.on_green
  end

  def wrong(letter)
    letter.upcase.light_white.on_light_black
  end

  def reference_words
    Words.new(reference_file).list
  end

  def solution_words
    Words.new(solution_file).list
  end

  def reference_file
    "wordlists/#{ @wordsize }_reference.txt"
  end

  def solution_file
    "wordlists/#{ @wordsize }_solution.txt"
  end

  def run
    guess_table = []
    puts

    guess = "match".downcase
    puts guess
    reduce_choices_by(guess)
    guess_table << wrong(guess[0])+wrong(guess[1])+wrong(guess[2])+wrong(guess[3])+wrong(guess[4])
    guess_table.each { |guess| puts guess }
    display_choices

    guess = "proud".downcase
    puts guess
    reduce_choices_by(guess)
    guess_table << correct(guess[0])+in_word(guess[1])+wrong(guess[2])+wrong(guess[3])+wrong(guess[4])
    guess_table.each { |guess| puts guess }
    display_choices

    guess = "piers".downcase
    puts guess
    reduce_choices_by(guess)
    guess_table << correct(guess[0])+wrong(guess[1])+in_word(guess[2])+in_word(guess[3])+wrong(guess[4])
    guess_table.each { |guess| puts guess }
    display_choices

    guess = "penny".downcase
    puts guess
    reduce_choices_by(guess)
    guess_table << correct(guess[0])+correct(guess[1])+wrong(guess[2])+wrong(guess[3])+correct(guess[4])
    guess_table.each { |guess| puts guess }
    display_choices

    guess = "perky".downcase
    puts guess
    reduce_choices_by(guess)
    guess_table << correct(guess[0])+correct(guess[1])+correct(guess[2])+correct(guess[3])+correct(guess[4])
    guess_table.each { |guess| puts guess }
    display_choices
  end
end
