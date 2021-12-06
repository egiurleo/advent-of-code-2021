# frozen_string_literal: true

# typed: strict

module AdventOfCode2021
  class Day3
    class DiagnosticReport
      extend T::Sig

      sig { params(binary_numbers: T::Array[String]).void }
      def initialize(binary_numbers)
        binary_numbers = binary_numbers.map { |binary_number| binary_number.chars.map(&:to_i) }
        @binary_numbers = T.let(binary_numbers, T::Array[T::Array[Integer]])
      end

      sig { returns(String) }
      def gamma_rate
        most_common_bits(@binary_numbers).join
      end

      sig { returns(String) }
      def epsilon_rate
        least_common_bits(@binary_numbers).join
      end

      sig { returns(Integer) }
      def power_consumption
        gamma_rate.to_i(2) * epsilon_rate.to_i(2)
      end

      sig { returns(String) }
      def oxygen_generator_rating
        filter_by_bits.join
      end

      sig { returns(String) }
      def co2_scrubber_rating
        filter_by_bits(most_common: false).join
      end

      sig { returns(Integer) }
      def life_support_rating
        oxygen_generator_rating.to_i(2) * co2_scrubber_rating.to_i(2)
      end

      private

      sig { params(binary_numbers: T::Array[T::Array[Integer]]).returns(T::Array[Integer]) }
      def most_common_bits(binary_numbers)
        binary_number_length = binary_numbers.fetch(0).length

        (0...binary_number_length)
          .to_a
          .map { |idx| binary_numbers.map { |number| number[idx] }.tally }
          .map do |tally|
            tally[0] ||= 0
            tally[1] ||= 0

            tally[0] > tally[1] ? 0 : 1
          end
      end

      sig { params(binary_numbers: T::Array[T::Array[Integer]]).returns(T::Array[Integer]) }
      def least_common_bits(binary_numbers)
        most_common_bits(binary_numbers).map do |bit|
          bit.zero? ? 1 : 0
        end
      end

      sig { params(most_common: T::Boolean).returns(T::Array[Integer]) }
      def filter_by_bits(most_common: true)
        filtered_binary_numbers = @binary_numbers.map(&:dup)
        current_idx = 0

        while filtered_binary_numbers.length > 1
          sorting_bits = if most_common
                           most_common_bits(filtered_binary_numbers)
                         else
                           least_common_bits(filtered_binary_numbers)
                         end

          filtered_binary_numbers = filtered_binary_numbers.filter do |binary_number|
            binary_number[current_idx] == sorting_bits[current_idx]
          end

          current_idx += 1
        end

        T.must(filtered_binary_numbers.first)
      end
    end
  end
end
