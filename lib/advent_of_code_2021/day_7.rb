# frozen_string_literal: true

# typed: strict

require 'sorbet-runtime'

module AdventOfCode2021
  class Day7
    extend T::Sig

    sig { params(input: String).void }
    def initialize(input)
      @input = T.let(input.chomp.split(',').map(&:to_i), T::Array[Integer])
    end

    sig { returns(Integer) }
    def part_one
      positions = @input.dup
      positions.sort!

      median = positions.fetch((positions.length / 2.0).floor)

      positions.sum { |pos| (pos - median).abs }
    end

    sig { returns(Integer) }
    def part_two
      positions = @input.dup
      mean = (positions.sum / (positions.length * 1.0)).floor

      positions.sum { |pos| (pos - mean).abs.downto(1).sum }
    end
  end
end
