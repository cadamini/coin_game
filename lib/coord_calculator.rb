require_relative 'sum_updater.rb'
# frozen_string_literal: true
class CoordCalculator
  attr_reader :coin_set

  class << self
    def run(coins_for_north, coins_for_east)
      sum = SumUpdater.new(initial_north: 0, initial_east: 0)

      coins_for_north.each do |coin|
        next if coin[0].nil?
        puts "#{coin[0]} (N)"
        sum.modify_north(value: coin[0])
      end

      coins_for_east.each do |coin|
        next if coin[0].nil?
        puts "#{coin[0]} (E)"
        sum.modify_east(value: coin[0])
      end

      sum.modify_north(value: value_north = 3)
      sum.modify_east(value: value_east = 2)
      puts "Custom values (N: #{value_north}, E: #{value_east}) added."
      print_output(sum.sum_north, sum.sum_east)
    end

    private

    def print_output(north, east)
      # TODO: check number of digits
      puts "Total North: #{north}"
      puts "Total East: #{east}"
      puts "N 51° 27.#{north} E 006° 59.#{east}"
    end
  end
end
