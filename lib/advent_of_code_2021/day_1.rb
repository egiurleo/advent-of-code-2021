# typed: strict
# frozen_string_literal: true

require 'sorbet-runtime'

module AdventOfCode2021
  class Day1
    extend T::Sig

    sig { params(input: String).void }
    def initialize(input)
      @input = T.let(input.chomp.split("\n").map(&:to_i), T::Array[Integer])
    end

    sig { returns(Integer) }
    def part_one
      @input.each_cons(2).filter { |pair| T.must(pair.first) < T.must(pair.last) }.length
    end

    sig { returns(Integer) }
    def part_two
      @input
        .each_cons(3)
        .map(&:sum)
        .each_cons(2)
        .filter { |pair| T.must(pair.first) < T.must(pair.last) }
        .length
    end
  end
end
