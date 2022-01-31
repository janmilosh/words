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
  
  def run
    guess_table = []
    valid_guesses = 0
    puts
    while valid_guesses < (@wordsize + 1) do
      puts 'Input a word or press "q" to quit:'
      guess = gets.chomp.downcase
      return if guess == "q"
      table_line = GuessEvaluator.new(guess, @reference_words, @solution).evaluate
      if table_line
        guess_table << table_line
        guess_table.each { |guess| puts guess }
        reduce_choices_by(guess)
        valid_guesses += 1
      else
        puts "#{ guess } is invalid, try again."
      end
      display_choices
    end
  end
end
