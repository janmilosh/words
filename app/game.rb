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
    @choices_reference = ('a'..'z').to_a
    @choices = ('a'..'z').to_a.map { |c| c.upcase }
  end
  
  def run
    guess_table = []
    valid_guesses = 0
    puts
    while valid_guesses < (@wordsize + 1) do
      puts 'Input a word or press "q" to quit:'
      guess = gets.chomp.downcase
      return if guess == "q"
      @guess_evaluator = GuessEvaluator.new(guess, @reference_words, @solution)
      table_line = @guess_evaluator.evaluate
      if table_line
        guess_table << table_line
        guess_table.each { |guess| puts guess }
        update_choices_colors
        valid_guesses += 1
      else
        puts "#{ guess } is invalid, try again."
      end
      display_choices
      if @guess_evaluator.game_over
        puts "You got it in #{valid_guesses} guesses!"
        return
      end
    end
  end

  def update_choices_colors
    @guess_evaluator.choice_color_updates.each do |k, v|
      i = @choices_reference.index(k)
      @choices[i] = v if choice_not_already_correct(i)
    end
  end

  def choice_not_already_correct(index)
    !@choices[index].include?('42m')
  end

  def display_choices
    puts
    puts @choices.join(' ')
    puts
  end
end
