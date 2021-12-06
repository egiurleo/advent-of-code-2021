# frozen_string_literal: true

describe AdventOfCode2021::Day3 do
  let(:input) { File.open('spec/input/day_3.txt').read }

  describe '#part_1' do
    it 'returns the correct answer' do
      expect(described_class.new(input).part_one).to eq(3_882_564)
    end
  end

  describe '#part_2' do
    it 'returns the correct answer' do
      expect(described_class.new(input).part_two).to eq(3_385_170)
    end

    context 'example' do
      let(:input) do
        <<~HEREDOC
          00100
          11110
          10110
          10111
          10101
          01111
          00111
          11100
          10000
          11001
          00010
          01010
        HEREDOC
      end

      it 'returns the correct answer' do
        expect(described_class.new(input).part_two).to eq(230)
      end
    end
  end
end
