require_relative '../app/guess_evaluator'

RSpec.describe GuessEvaluator do
  
  let(:reference_words) { Words.new(5).reference_words }
  let(:with_good_guess) { GuessEvaluator.new('proud', reference_words, 'perky') }
  let(:with_bad_guess) { GuessEvaluator.new('lroud', reference_words, 'perky') }
  let(:table_line) { "\e[0;97;42mP\e[0m\e[0;97;43mR\e[0m\e[0;97;100mO\e[0m\e[0;97;100mU\e[0m\e[0;97;100mD\e[0m" }
  
  describe '#real_word?' do
    it 'returns true if the word is real' do
      expect(with_good_guess.real_word?).to be true
    end

    it 'returns false if the word is not real' do
      expect(with_bad_guess.real_word?).to be false
    end
  end

  describe '#evaluate' do
    it 'checks the guess against the solution' do
      expect(with_good_guess.evaluate).to eq table_line
    end

    it 'returns false if word is invalid' do
      expect(with_bad_guess.evaluate).to be false
    end
  end
end
