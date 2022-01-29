# frozen_string_literal: true

module AdventOfCode2021
  class Day5
    class VentSystem
      extend T::Sig

      sig { params(coords: T::Array[T::Array[Integer]]).void }
      def initialize(coords)
        @vents = T.let([], T::Array[AdventOfCode2021::Day5::Vent])

        coords.each do |x1, y1, x2, y2|
          @vents << Vent.new(x1, y1, x2, y2)
        end
      end

      sig { params(diagonals_allowed: T::Boolean).returns(T::Hash[T::Array[Integer], Integer]) }
      def num_vents_per_point(diagonals_allowed: false)
        return @points unless @points.nil?

        @points = Hash.new(0)

        @vents.each do |vent|
          next if !diagonals_allowed && vent.diagonal?

          vent.covered_points.each do |x, y|
            @points[[x, y]] += 1
          end
        end

        @points
      end
    end
  end
end
