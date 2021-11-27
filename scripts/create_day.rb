#!/usr/bin/env ruby
# frozen_string_literal: true

class DayCreator
  def self.run(day)
    File.write("lib/advent_of_code_2021/day_#{day}.rb",
               <<~HEREDOC
                 module AdventOfCode2021
                   class Day#{day}
                     def initialize(input)
                       @input = input.chomp.split(',')
                     end

                     def part_one
                     end

                     def part_two
                     end
                   end
                 end
               HEREDOC
              )

    File.open('lib/advent_of_code_2021.rb', 'a') do |f|
      f.puts "require 'advent_of_code_2021/day_#{day}'"
    end

    File.write("spec/input/day_#{day}.txt", '')
    File.write("spec/advent_of_code_2021/day_#{day}_spec.rb",
               <<~HEREDOC
                 describe AdventOfCode2021::Day#{day} do
                   let(:input) { File.open('spec/input/day_#{day}.txt').read }

                   describe '#part_1' do
                   end

                   describe '#part_2' do
                   end
                 end
               HEREDOC
              )
  end
end

argument = ARGV.first.to_i

raise 'Cannot create new files without specifying a day' unless argument

raise 'Day must be an integer between 1 and 25' unless argument.is_a?(Integer) && argument <= 25 && argument >= 1

DayCreator.run(ARGV.first)
