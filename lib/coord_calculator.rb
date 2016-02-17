require_relative 'sum_updater.rb'
# frozen_string_literal: true
class CoordCalculator
  attr_reader :coin_set

  class << self
    def run(coin_set)
      sum = SumUpdater.new(initial_north: 0, initial_east: 0)

      coin_set.coins.each do |coin|
        next if coin[0].nil?
        print coin[0]
        # TODO: add function to choose certain coins
        # e.g. via
        # arr[100..200] ???
        # input.is_a?(FixNum)
        # input.is_a?(Array)

        # need to change set which is used in line 10 before!

        limit_result_for(sum, coin)
      end
      # add custom value
      # make it configurable from outside
      sum.modify_north(value: value_north = 3)
      sum.modify_east(value: value_east = 2)
      puts "Custom values (N: #{value_north}, E: #{value_east}) added."
      print_output(sum.sum_north, sum.sum_east)
    end

    private

    def limit_result_for(sum, coin)
      # coins for north
      if coins_for_north(coin)
        puts ' (N)'
        sum.modify_north(value: coin[0])

      # coins for east
      elsif coins_for_east(coin)
        puts ' (E)'
        sum.modify_east(value: coin[0])
      else
        puts '' # required for correct output
      end
    end

    def coins_for_north(coin)
      coin[0] <= 17 || (coin[0] >= 41 && coin[0] <= 131)
    end

    def coins_for_east(coin)
      (coin[0] >= 122 && coin[0] <= 141) ||
        (coin[0] >= 200 && coin[0] <= 220)
    end

    def print_output(north, east)
      # TODO: check number of digits
      puts "Total North: #{north}"
      puts "Total East: #{east}"
      puts "N 51° 27.#{north} E 006° 59.#{east}"
    end
  end
end
