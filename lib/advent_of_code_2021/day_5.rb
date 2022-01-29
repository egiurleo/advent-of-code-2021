# frozen_string_literal: true

# typed: strict

require 'sorbet-runtime'

require_relative 'day_5/vent'
require_relative 'day_5/vent_system'

module AdventOfCode2021
  class Day5
    extend T::Sig

    sig { params(input: String).void }
    def initialize(input)
      @input = T.let(input.chomp.split("\n"), T::Array[String])
      coords = @input.map do |line|
        coord1, coord2 = line.split(' -> ')
        x1, y1 = T.must(coord1).split(',').map(&:to_i)
        x2, y2 = T.must(coord2).split(',').map(&:to_i)

        [x1, y1, x2, y2]
      end

      @vent_system = T.let(VentSystem.new(coords), AdventOfCode2021::Day5::VentSystem)
    end

    sig { returns(Integer) }
    def part_one
      @vent_system.num_vents_per_point.select { |_point, num_vents| num_vents >= 2 }.length
    end

    sig { returns(Integer) }
    def part_two
      @vent_system
        .num_vents_per_point(diagonals_allowed: true)
        .select { |_point, num_vents| num_vents >= 2 }
        .length
    end
  end
end
