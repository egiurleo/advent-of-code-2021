# frozen_string_literal: true

# typed: strict

module AdventOfCode2021
  class SubmarinePilotModule
    class Command
      extend T::Sig

      DOWN = T.let(:down, Symbol)
      FORWARD = T.let(:forward, Symbol)
      UP = T.let(:up, Symbol)

      DIRECTIONS = T.let([DOWN, FORWARD, UP], T::Array[Symbol])

      sig { returns(Symbol) }
      attr_reader :direction

      sig { returns(Integer) }
      attr_reader :distance

      sig { params(direction: String, distance: Integer).void }
      def initialize(direction, distance)
        direction = direction.to_sym

        raise ArgumentError, "Invalid direction: #{direction}" unless DIRECTIONS.include?(direction)

        @direction = T.let(direction.to_sym, Symbol)
        @distance = T.let(distance, Integer)
      end
    end
  end
end
