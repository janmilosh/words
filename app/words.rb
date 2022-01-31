class Words
  def initialize(wordsize)
    @wordsize = wordsize
  end

  def solution
    solution_words.sample
  end

  def reference_words
    list(reference_file)
  end

  def solution_words
    list(solution_file)
  end

  def reference_file
    "#{ __dir__ }/wordlists/#{ @wordsize }_reference.txt"
  end

  def solution_file
    "#{ __dir__ }/wordlists/#{ @wordsize }_solution.txt"
  end

  def list(filename)
    Marshal.load File.read(filename)
  end
end
