# frozen_string_literal: true

# typed: strict

require 'sorbet-runtime'

require_relative 'day_6/school'

module AdventOfCode2021
  class Day6
    extend T::Sig

    sig { params(input: String).void }
    def initialize(input)
      @input = T.let(input.chomp.split("\n"), T::Array[String])
      @school = T.let(School.new(T.must(@input.first).split(',').map(&:to_i)), School)
    end

    sig { returns(Integer) }
    def part_one
      @school.age_days(80)
      @school.num_fishes
    end

    sig { returns(Integer) }
    def part_two
      @school.age_days(256)
      @school.num_fishes
    end
  end
end
