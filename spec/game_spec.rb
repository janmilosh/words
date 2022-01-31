require_relative '../app/game'

RSpec.describe Game do
  describe '#initialize' do
    let(:game) { Game.new(5) }
    let(:words) { game.reference_words }
    let(:solution) { game.solution }

    it 'initializes a reference words array' do
      expect(words).to be_kind_of(Array)
    end

    it 'reference words is the right size' do
      expect(words.size).to be > 9000
    end

    it 'initializes a solution word' do
      expect(solution).to be_kind_of(String)
    end

    it 'solution word is the right size' do
      expect(solution.size).to eq 5
    end
  end
end
