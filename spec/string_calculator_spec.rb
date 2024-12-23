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

    it 'returns 0 for an empty string' do
      expect(calculator.add('')).to eq(0)
    end

    it 'returns 0 for nil input' do
      expect(calculator.add(nil)).to eq(0)
    end

    it 'returns 0 for whitespace input' do
      expect(calculator.add(' ')).to eq(0)
      expect(calculator.add("\n")).to eq(0)
    end

    it 'ignores numbers greater than 1000' do
      expect(calculator.add('2,1001')).to eq(2)
    end

    it 'handles complex custom delimiters' do
      expect(calculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it 'returns 0 for a string with no numbers and custom delimiter' do
      expect(calculator.add("//;\n;")).to eq(0)
    end

    it 'handles multiple custom delimiters' do
      expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
    end

    it 'raises an error for multiple negative numbers' do
      expect { calculator.add('1,-2,3,-4') }
        .to raise_error('negative numbers not allowed: -2, -4')
    end
   
    it 'returns the sum of numbers when separated by commas and newlines' do
      expect(calculator.add("1,2,3")).to eq(6)
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'raises an error for a single negative number' do
      expect { calculator.add('1,-2,3') }
        .to raise_error('negative numbers not allowed: -2')
    end
  
    it 'returns 0 when the input contains numbers greater than 1000' do
      expect(calculator.add('1000,1001')).to eq(1000)
    end
    
  end
end
