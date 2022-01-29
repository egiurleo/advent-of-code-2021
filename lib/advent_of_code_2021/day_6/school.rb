# frozen_string_literal: true

# typed: strict

module AdventOfCode2021
  class Day6
    class School
      extend T::Sig

      AGE_OF_NEW_FISH = 8
      AGE_OF_RESTARTED_FISH = 6

      sig { params(ages: T::Array[Integer]).void }
      def initialize(ages)
        @fish_counts = T.let([0, 0, 0, 0, 0, 0, 0, 0, 0], T::Array[Integer])

        ages.each { |age| @fish_counts[age] = @fish_counts.fetch(age) + 1 }
      end

      sig { void }
      def age_up
        old_old_fish = @fish_counts.last

        AGE_OF_NEW_FISH.downto(1).each do |age|
          old_fish = @fish_counts[age - 1]
          @fish_counts[age - 1] = T.must(old_old_fish)
          old_old_fish = old_fish
        end

        @fish_counts[AGE_OF_NEW_FISH] = T.must(old_old_fish)
        @fish_counts[AGE_OF_RESTARTED_FISH] = @fish_counts.fetch(AGE_OF_RESTARTED_FISH) + T.must(old_old_fish)
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
