module AdventOfCode2021
  class Day4
    class BingoSubsystem
      extend T::Sig

      sig { params(numbers: T::Array[Integer], boards: T::Array[T::Array[T::Array[Integer]]]).void }
      def initialize(numbers, boards)
        @numbers = T.let(numbers.dup, T::Array[Integer])
        @boards = T.let([], T::Array[AdventOfCode2021::Day4::BingoBoard])
        @winner = T.let(nil, T.nilable(AdventOfCode2021::Day4::BingoBoard))

        boards.each do |board_numbers|
          @boards << BingoBoard.new(board_numbers)
        end
      end

      sig { void }
      def play
        while !won?
          draw
        end
      end

      sig { void }
      def draw
        return if @numbers.empty? || won?

        number = @numbers.shift
        @boards.each { |board| board.mark(number) }
        @winner = @boards.find(&:won?)
      end

      sig { returns(T::Boolean) }
      def won?
        !@winner.nil?
      end

      sig { returns(Integer) }
      def score
        @winner&.score
      end
    end
  end
end
