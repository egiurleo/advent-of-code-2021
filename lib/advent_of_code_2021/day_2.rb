# frozen_string_literal: true

# typed: strict

require 'sorbet-runtime'
require_relative 'day_2/command'
require_relative 'day_2/submarine_pilot_module'
require_relative 'day_2/aimed_submarine_pilot_module'

module AdventOfCode2021
  class Day2
    extend T::Sig

    sig { params(input: String).void }
    def initialize(input)
      input = input.chomp.split("\n")
      commands = input.map do |line|
        direction, distance = line.split
        SubmarinePilotModule::Command.new(T.must(direction), distance.to_i)
      end

      @commands = T.let(commands, T::Array[SubmarinePilotModule::Command])
    end

    sig { returns(Integer) }
    def part_one
      submarine_pilot_module = SubmarinePilotModule.new

      @commands.each do |command|
        submarine_pilot_module.perform(command)
      end

      submarine_pilot_module.horizontal_pos * submarine_pilot_module.depth
    end

    sig { returns(Integer) }
    def part_two
      submarine_pilot_module = AimedSubmarinePilotModule.new

      @commands.each do |command|
        submarine_pilot_module.perform(command)
      end

      submarine_pilot_module.horizontal_pos * submarine_pilot_module.depth
    end
  end
end
