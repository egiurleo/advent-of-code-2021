# frozen_string_literal: true

# typed: strict

module AdventOfCode2021
  class SubmarinePilotModule
    extend T::Sig

    sig { returns(Integer) }
    attr_reader :horizontal_pos

    sig { returns(Integer) }
    attr_reader :depth

    sig { void }
    def initialize
      @horizontal_pos = T.let(0, Integer)
      @depth = T.let(0, Integer)
    end

    sig { params(command: Command).void }
    def perform(command)
      case command.direction
      when Command::FORWARD
        @horizontal_pos += command.distance
      when Command::DOWN
        @depth += command.distance
      when Command::UP
        @depth -= command.distance
      end
    end
  end
end
