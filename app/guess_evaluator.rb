require_relative './words'

class GuessEvaluator
  attr_reader :guess, :reference_words, :choice_color_updates, :game_over
  
  def initialize(guess, reference_words, solution)
    @guess = guess
    @reference_words = reference_words
    @solution = solution
    @wordsize = solution.size
    @choice_color_updates = {}
    @game_over = false
  end

  def evaluate
    return false if !real_word?
    prepare_evaluation_arrays
    evaluate_correct_letters
    evaluate_in_word_letters
    evaluate_wrong_letters
    @table_array.join('')
  end

  def real_word?
    @reference_words.include?(@guess)
  end

  def prepare_evaluation_arrays
    @s = @solution.split('')
    @g = @guess.split('')
    @table_array = []
    @wordsize.times { |i| @table_array[i] = nil }
  end

  def evaluate_correct_letters
    @wordsize.times do |i|
      if @g[i] == @s[i] && @s[i] != nil
        @table_array[i] = correct(@g[i])
        @choice_color_updates[@g[i]] = correct(@g[i])
        @s[i] = nil
        @g[i] = nil
        @game_over = true if @s.uniq.size == 1
      end
    end
  end

  def evaluate_in_word_letters
    @wordsize.times do |i|
      if @g[i] != nil && @s.include?(@g[i])
        @table_array[i] = in_word(@g[i])
        @choice_color_updates[@g[i]] = in_word(@g[i])
        @s[@s.index(@g[i])] = nil
        @g[i] = nil
      end
    end
  end

  def evaluate_wrong_letters
    @wordsize.times do |i|
      if @g[i] != nil
        @table_array[i] = wrong(@g[i])
        @choice_color_updates[@g[i]] = wrong(@g[i])
      end
    end
  end

  def correct(letter)
    letter.upcase.light_white.on_green
  end

  def in_word(letter)
    letter.upcase.light_white.on_yellow
  end

  def wrong(letter)
    letter.upcase.light_white.on_light_black
  end
end
