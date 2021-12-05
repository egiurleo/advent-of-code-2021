# frozen_string_literal: true

# typed: strict

require 'sorbet-runtime'

require_relative 'day_3/diagnostic_report'

module AdventOfCode2021
  class Day3
    extend T::Sig

    sig { params(input: String).void }
    def initialize(input)
      @input = T.let(input.chomp.split("\n"), T::Array[String])
      @diagnostic_report = T.let(DiagnosticReport.new(@input), DiagnosticReport)
    end

    sig { returns(Integer) }
    def part_one
      @diagnostic_report.power_consumption
    end

    sig { returns(Integer) }
    def part_two
      @diagnostic_report.life_support_rating
    end
  end
end
