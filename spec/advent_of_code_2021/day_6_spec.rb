# frozen_string_literal: true

describe AdventOfCode2021::Day6 do
  let(:input) { File.open('spec/input/day_6.txt').read }
  let(:test_input) { '3,4,3,1,2' }

  describe '#part_1' do
    it 'returns the correct answer with test input' do
      expect(described_class.new(test_input).part_one).to eq(5934)
    end

    it 'returns the correct answer' do
      expect(described_class.new(input).part_one).to eq(362_740)
    end
  end

  describe '#part_2' do
    it 'returns the correct answer' do
      expect(described_class.new(input).part_two).to eq(1_644_874_076_764)
    end
  end
end
