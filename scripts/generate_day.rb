#!/usr/bin/env ruby
# typed: true
# frozen_string_literal: true

class DayGenerator
  def self.run(day)
    File.write("lib/advent_of_code_2021/day_#{day}.rb",
               <<~HEREDOC
                 # typed: strict

                 require 'sorbet-runtime'

                 module AdventOfCode2021
                   class Day#{day}
                     extend T::Sig

                     sig { params(input: String).void }
                     def initialize(input)
                       @input = T.let(input.chomp.split("\\n"), T::Array[String])
                     end

                     sig { void }
                     def part_one
                     end

                     sig { void }
                     def part_two
                     end
                   end
                 end
               HEREDOC
              )

    File.open('lib/advent_of_code_2021.rb', 'a') do |f|
      f.puts "require_relative 'advent_of_code_2021/day_#{day}'"
    end

    File.write("spec/input/day_#{day}.txt", '')
    File.write("spec/advent_of_code_2021/day_#{day}_spec.rb",
               <<~HEREDOC
                 describe AdventOfCode2021::Day#{day} do
                   let(:input) { File.open('spec/input/day_#{day}.txt').read }

                   describe '#part_1' do
                     it 'returns the correct answer' do
                       expect(described_class.new(input).part_one).to eq(0)
                     end
                   end

                   describe '#part_2' do
                     it 'returns the correct answer' do
                       expect(described_class.new(input).part_two).to eq(0)
                     end
                   end
                 end
               HEREDOC
              )
  end
end

argument = ARGV.first.to_i

raise 'Cannot create new files without specifying a day' unless argument

raise 'Day must be an integer between 1 and 25' unless argument.is_a?(Integer) && argument <= 25 && argument >= 1

DayGenerator.run(ARGV.first)
