class Words
  def initialize(filename)
    @filename = filename
  end

  def list
    Marshal.load File.read(@filename)
  end
end
