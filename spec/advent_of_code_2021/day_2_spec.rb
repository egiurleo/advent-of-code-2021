# frozen_string_literal: true

describe AdventOfCode2021::Day2 do
  let(:input) { File.open('spec/input/day_2.txt').read }

  describe '#part_1' do
    it 'returns the correct answer' do
      expect(described_class.new(input).part_one).to eq(1_694_130)
    end
  end

  describe '#part_2' do
    it 'returns the correct answer' do
      expect(described_class.new(input).part_two).to eq(1_698_850_445)
    end
  end
end
