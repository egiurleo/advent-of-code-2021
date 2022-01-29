# frozen_string_literal: true

# typed: strict

module AdventOfCode2021
  class Day5
    class Vent
      extend T::Sig

      sig { params(x1: Integer, y1: Integer, x2: Integer, y2: Integer).void }
      def initialize(x1, y1, x2, y2)
        @x1 = T.let(x1, Integer)
        @y1 = T.let(y1, Integer)
        @x2 = T.let(x2, Integer)
        @y2 = T.let(y2, Integer)
      end

      sig { returns(T::Array[T::Array[Integer]]) }
      def covered_points
        points = []

        curr_x = @x1
        curr_y = @y1

        while curr_x != @x2 || curr_y != @y2
          points << [curr_x, curr_y]

          curr_x += delta_x
          curr_y += delta_y
        end

        points << [curr_x, curr_y]

        points
      end

      sig { params(x: Integer, y: Integer).returns(T::Boolean) }
      def covers?(x, y)
        xs = [@x1, @x2].sort
        ys = [@y1, @y2].sort

        x >= T.must(xs.first) && x <= T.must(xs.last) && y >= T.must(ys.first) && y <= T.must(ys.last)
      end

      sig { returns(T::Boolean) }
      def vertical?
        @y1 == @y2
      end

      sig { returns(T::Boolean) }
      def horizontal?
        @x1 == @x2
      end

      sig { returns(T::Boolean) }
      def diagonal?
        !(vertical? || horizontal?)
      end

      private

      sig { returns(Integer) }
      def delta_x
        if @x1 == @x2
          0
        elsif @x1 < @x2
          1
        else
          -1
        end
      end

      sig { returns(Integer) }
      def delta_y
        if @y1 == @y2
          0
        elsif @y1 < @y2
          1
        else
          -1
        end
      end
    end
  end
end
