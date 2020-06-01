# frozen_string_literal: true

require_relative 'lib/coord_calculator'
require_relative 'lib/coin_repository'
require_relative 'lib/coin_set_generator'
require_relative 'lib/iterator'

class Game
  def self.start
    number_of_coins = ARGV[0].to_i
    coin_set = CoinSet.new(number_of_coins)
    Iterator.new(coin_set).flip_every_nth_coin
    coin_set.coins
  end

  def self.north(coins)
    coins = CoinRepository.new(coins)
    coins.find(:greater, first: 256)
    coins.find(:smaller, first: 18)
    coins.find(:between, first: 40, last: 131)
    puts "N 51° 27.#{CoordCalculator.build_sum(coins: coins, extra: 3)}"
  end

  def self.east(coins)
    coins = CoinRepository.new(coins)
    coins.find(:greater, first: 256)
    coins.find(:smaller, first: 1)
    coins.find(:between, first: 121, last: 142)
    coins.find(:between, first: 199, last: 221)
    puts "E 006° 59.#{CoordCalculator.build_sum(coins: coins, extra: 2)}"
  end
end

coins = Game.start
Game.north(coins)
Game.east(coins)
