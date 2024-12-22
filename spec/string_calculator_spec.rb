require 'rspec'
require_relative '../lib/string_calculator'


RSpec.describe StringCalculator do
  subject(:calculator) { described_class.new }

  describe '#add' do
    it 'returns 1000 for a number equal to 1000' do
      expect(calculator.add('1000')).to eq(1000)
    end
      
    it 'returns 0 for a string with no valid numbers' do
      expect(calculator.add('abc')).to eq(0)
    end
  end
end
