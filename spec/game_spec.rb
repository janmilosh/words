require_relative '../game'

RSpec.describe Game do
  describe '#reduce_choice_by' do
    let(:game) { Game.new(5) }
    let(:guess_1) { 'about' }
    let(:guess_2) { 'nouns' }
    let(:choices_1) { ['c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 'v', 'w', 'x', 'y', 'z'] }
    let(:choices_2) { ['c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'p', 'q', 'r', 'v', 'w', 'x', 'y', 'z'] }
    
    it 'reduces the choices when unique' do
      game.reduce_choices_by(guess_1)
      expect(game.choices).to eq(choices_1)
    end

    it 'reduces the choices when letters from choices overlap' do
      game.reduce_choices_by(guess_1)
      game.reduce_choices_by(guess_2)
      expect(game.choices).to eq(choices_2)
    end

    it 'gets the solution words array' do
      words = game.solution_words
      expect(words).to be_kind_of(Array)
      expect(words.size).to be > 1000
    end

    it 'gets the reference words array' do
      words = game.reference_words
      expect(words).to be_kind_of(Array)
      expect(words.size).to be > 9000
    end
  end  
end
