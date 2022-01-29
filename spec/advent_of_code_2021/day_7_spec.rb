# frozen_string_literal: true

describe AdventOfCode2021::Day7 do
  let(:input) { File.open('spec/input/day_7.txt').read }
  let(:test_input) { '16,1,2,0,4,2,7,1,2,14' }

  describe '#part_1' do
    it 'returns the correct answer with test input' do
      expect(described_class.new(test_input).part_one).to eq(37)
    end

    it 'returns the correct answer' do
      expect(described_class.new(input).part_one).to eq(336_040)
    end
  end

  describe '#part_2' do
    it 'returns the correct answer with test input' do
      pending
      expect(described_class.new(test_input).part_two).to eq(168)
    end

    it 'returns the correct answer' do
      expect(described_class.new(input).part_two).to eq(94_813_675)
    end
  end
end
