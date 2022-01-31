require_relative './words'

class GuessEvaluator
  attr_reader :guess, :reference_words
  
  def initialize(guess, reference_words, solution)
    @guess = guess
    @reference_words = reference_words
    @solution = solution
  end

  def real_word?
    @reference_words.include?(@guess)
  end

  def evaluate
    if !real_word?
      return false
    end
    table_line = ""
    s = @solution.split('')
    g = @guess.split('')
    s.size.times do |i|
      if g[i] == s[i]
        table_line += correct(g[i])
        s[i] = nil
        g[i] = nil
      elsif s.include?(g[i])
        table_line += in_word(g[i])
      else
        table_line += wrong(g[i])
      end
    end
    table_line
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
end
