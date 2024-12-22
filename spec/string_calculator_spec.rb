require 'rspec'
require_relative '../lib/string_calculator'


RSpec.describe StringCalculator do
  subject(:calculator) { described_class.new }

  describe '#add' do
    it 'ignores numbers greater than 1000' do
        expect(calculator.add('2,1001')).to eq(2) # Expected output
    end
  end
end
