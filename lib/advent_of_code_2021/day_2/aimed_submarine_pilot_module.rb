# frozen_string_literal: true

# typed: strict

module AdventOfCode2021
  class AimedSubmarinePilotModule < SubmarinePilotModule
    extend T::Sig

    sig { returns(Integer) }
    attr_reader :aim

    sig { void }
    def initialize
      @aim = T.let(0, Integer)

      super
    end

    sig { params(command: Command).void }
    def perform(command)
      case command.direction
      when Command::FORWARD
        @horizontal_pos += command.distance
        @depth += @aim * command.distance
      when Command::DOWN
        @aim += command.distance
      when Command::UP
        @aim -= command.distance
      end
    end
  end
end
