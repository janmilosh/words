require 'colorize'
require_relative './words'
require_relative './guess_evaluator'

class Game
  attr_reader :wordlist, :solution, :choices, :reference_words
  
  def initialize(wordsize)
    words = Words.new(wordsize)
    @wordsize = wordsize
    @reference_words = words.reference_words
    @solution = words.solution
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
  
  def run
    guess_table = []
    puts

    (@wordsize + 1).times do |i|
      puts 'Input a word or press "q" to quit:'
      guess = gets.chomp.downcase
      return if guess == "q"
      reduce_choices_by(guess)
      table_line = GuessEvaluator.new(guess, @reference_words, @solution).evaluate
      if table_line
        guess_table << table_line
      else
        puts "#{ guess } is invalid, try again."
      end
      guess_table.each { |guess| puts guess }
      display_choices
    end
  end
end
