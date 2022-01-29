# frozen_string_literal: true

module AdventOfCode2021
  class Day4
    class BingoSubsystem
      extend T::Sig

      attr_reader :winners

      sig { params(numbers: T::Array[Integer], boards: T::Array[T::Array[T::Array[Integer]]]).void }
      def initialize(numbers, boards)
        @numbers = T.let(numbers.dup, T::Array[Integer])
        @boards = T.let([], T::Array[AdventOfCode2021::Day4::BingoBoard])
        @winners = T.let([], T::Array[AdventOfCode2021::Day4::BingoBoard])

        boards.each do |board_numbers|
          @boards << BingoBoard.new(board_numbers)
        end
      end

      sig { void }
      def play
        draw until @numbers.empty?
      end

      sig { void }
      def draw
        return if @numbers.empty?

        number = @numbers.shift
        @boards.each do |board|
          next if board.won?

          board.mark(number)
          @winners << board if board.won?
        end
      end
    end
  end
end
