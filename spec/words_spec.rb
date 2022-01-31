require_relative '../app/game'

RSpec.describe Words do
  let(:words) { Words.new(7) }
  let(:reference_words) { words.reference_words }
  
  describe '#solution_words' do
    let(:solution_words) { words.solution_words }
    
    it 'is an array' do
      expect(solution_words).to be_kind_of(Array)
    end

    it 'is the right size' do
      expect(solution_words.size).to be > 1200
    end
  end

  describe '#reference_words' do
    it 'is an array' do
      expect(reference_words).to be_kind_of(Array)
    end

    it 'is the right size' do
      expect(reference_words.size).to be > 25000
    end
  end

  describe '#solution' do
    let(:solution) { words.solution }
 
    it 'chooses a valid word' do
      expect(reference_words).to include(solution)
    end
  end
end