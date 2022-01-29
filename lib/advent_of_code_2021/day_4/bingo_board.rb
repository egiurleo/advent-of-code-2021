# typed: strict

module AdventOfCode2021
  class Day4
    class BingoBoard
      extend T::Sig

      sig { params(numbers: T::Array[T::Array[Integer]]).void }
      def initialize(numbers)
        @board_size = T.let(numbers.length, Integer)
        @numbers_to_positions = T.let({}, T::Hash[Integer, T.nilable(T::Array[Integer])])
        @numbers_to_marked = T.let({}, T::Hash[Integer, T::Boolean])
        @last_marked_number = T.let(nil, T.nilable(Integer))

        numbers.each_with_index do |row, i|
          row.each_with_index do |num, j|
            @numbers_to_positions[num] = [i, j]
            @numbers_to_marked[num] = false
          end
        end

        @marked_rows = T.let(Array.new(@board_size, 0), T::Array[Integer])
        @marked_cols = T.let(Array.new(@board_size, 0), T::Array[Integer])
      end

      sig { params(num: Integer).void }
      def mark(num)
        position = @numbers_to_positions[num]
        return if position.nil?

        @numbers_to_marked[num] = true
        @last_marked_number = num

        row, col = position
        @marked_rows[row] = @marked_rows.fetch(row) + 1
        @marked_cols[col] = @marked_cols.fetch(col) + 1
      end

      sig { returns(T::Boolean) }
      def won?
        @marked_rows.any? { |num_marked| num_marked == @board_size} ||
          @marked_cols.any? { |num_marked| num_marked == @board_size }
      end

      sig { returns(Integer) }
      def score
        sum = @numbers_to_marked.select { |num, marked| !marked }.sum { |num, _| num }
        sum * @last_marked_number
      end
    end
  end
end
