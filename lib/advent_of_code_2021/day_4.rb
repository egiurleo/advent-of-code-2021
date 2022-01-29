# frozen_string_literal: true

# typed: strict

require 'sorbet-runtime'

require_relative 'day_4/bingo_board'
require_relative 'day_4/bingo_subsystem'

module AdventOfCode2021
  class Day4
    extend T::Sig

    sig { params(input: String).void }
    def initialize(input)
      @input = T.let(input.chomp.split("\n"), T::Array[String])

      numbers = T.must(@input.shift).split(',').map(&:to_i)
      @input.shift
      @input += ['']

      boards = []
      curr_board = []
      @input.each do |line|
        if line == ''
          boards << curr_board
          curr_board = []
          next
        end

        curr_board << line.split.map(&:to_i)
      end

      @bingo_subsystem = T.let(
        BingoSubsystem.new(numbers, boards),
        AdventOfCode2021::Day4::BingoSubsystem
      )
    end

    sig { returns(Integer) }
    def part_one
      @bingo_subsystem.play
      @bingo_subsystem.winners.first.score
    end

    sig { returns(Integer) }
    def part_two
      @bingo_subsystem.play
      @bingo_subsystem.winners.last.score
    end
  end
end
