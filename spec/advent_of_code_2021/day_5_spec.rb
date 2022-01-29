# frozen_string_literal: true

describe AdventOfCode2021::Day5 do
  let(:input) { File.open('spec/input/day_5.txt').read }
  let(:test_input) do
    <<~TEST_INPUT
      0,9 -> 5,9
      8,0 -> 0,8
      9,4 -> 3,4
      2,2 -> 2,1
      7,0 -> 7,4
      6,4 -> 2,0
      0,9 -> 2,9
      3,4 -> 1,4
      0,0 -> 8,8
      5,5 -> 8,2
    TEST_INPUT
  end

  describe '#part_1' do
    it 'returns the correct answer' do
      expect(described_class.new(input).part_one).to eq(5197)
    end
  end

  describe '#part_2' do
    it 'returns the correct answer for test input' do
      expect(described_class.new(test_input).part_two).to eq(12)
    end

    it 'returns the correct answer' do
      expect(described_class.new(input).part_two).to eq(18_605)
    end
  end
end
