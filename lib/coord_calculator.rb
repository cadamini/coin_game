# frozen_string_literal: true
class CoordCalculator
  attr_reader :last_coin_set
  attr_accessor :sum_north, :sum_east

  def initialize(last_coin_set:)
    @sum_north = 0
    @sum_east = 0
    @last_coin_set = last_coin_set
  end

  def calculate_coordinates
    last_coin_set.coins.each do |coin|
      next if coin[0].nil?
      print coin[0]
      # TODO: add function to choose certain coins
      consider_certain_coins(coin)
    end
    add_custom_values(north: 3, east: 2)
    print_output
  end

  private

  def consider_certain_coins(coin)
    if consider_for_north(coin)
      puts '(N)'
      @sum_north += coin[0]
    elsif consider_for_east(coin)
      puts '(E)'
      @sum_east += coin[0]
    else
      puts ''
    end
  end

  def consider_for_north(coin)
    coin[0] <= 17 || (coin[0] >= 41 && coin[0] <= 131)
  end

  def consider_for_east(coin)
    (coin[0] >= 122 && coin[0] <= 141) || (coin[0] >= 200 && coin[0] <= 220)
  end

  def add_custom_values(north:, east:)
    @sum_north += north
    puts "Adding #{north} to north."
    @sum_east += east
    puts "Adding #{east} to east."
  end

  def print_output
    puts "Total North: #{@sum_north}"
    puts "Total East: #{@sum_east}"
    puts "N 51° 27.#{@sum_north} E 006° 59.#{@sum_east}"
  end
end
