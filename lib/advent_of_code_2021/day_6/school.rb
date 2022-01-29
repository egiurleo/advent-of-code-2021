# frozen_string_literal: true

# typed: strict

module AdventOfCode2021
  class Day6
    class School
      extend T::Sig

      sig { params(ages: T::Array[Integer]).void }
      def initialize(ages)
        @fish_counts = T.let(Array.new(8, 0), T::Array[Integer])

        ages.each { |age| @fish_counts[age] = @fish_counts.fetch(age) + 1 }
      end

      sig { void }
      def age_up
        num_older_fish = T.must(@fish_counts.last)

        8.downto(1).each do |age|
          num_younger_fish = T.must(@fish_counts[age - 1])
          @fish_counts[age - 1] = num_older_fish
          num_older_fish = num_younger_fish
        end

        @fish_counts[8] = num_older_fish
        @fish_counts[6] = @fish_counts.fetch(6) + num_older_fish
      end

      sig { params(days: Integer).void }
      def age_days(days)
        days.times { age_up }
      end

      sig { returns(Integer) }
      def num_fishes
        @fish_counts.reduce(:+)
      end
    end
  end
end
