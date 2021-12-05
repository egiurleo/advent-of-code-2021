# frozen_string_literal: true

require 'spec_helper'

describe AdventOfCode2021::Day1 do
  let(:input) { File.open('spec/input/day_1.txt').read }

  describe '#part_one' do
    it 'returns the correct answer' do
      expect(described_class.new(input).part_one).to eq(1393)
    end
  end

  describe '#part_two' do
    it 'returns the correct answer' do
      expect(described_class.new(input).part_two).to eq(1359)
    end
  end
end
