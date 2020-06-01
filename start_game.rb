# frozen_string_literal: true

require_relative 'lib/coords'
require_relative 'lib/coin_repository'
require_relative 'lib/coin_set'
require_relative 'lib/iterator'

class Game
  def self.start
    coins = ARGV[0].to_i
    pp coins
    set = CoinSet.new(coins)
    Iterator.new(set).flip_every_nth_coin
    set.coins
  end

  def self.north(coins)
    coins = CoinRepository.new(coins)
    coins.find(:greater, first: 256)
    coins.find(:smaller, first: 18)
    coins.find(:between, first: 40, last: 131)
    puts "N 51° 27.#{Coords.build(coins: coins, extra: 3)}"
  end

  def self.east(coins)
    coins = CoinRepository.new(coins)
    coins.find(:greater, first: 256)
    coins.find(:smaller, first: 1)
    coins.find(:between, first: 121, last: 142)
    coins.find(:between, first: 199, last: 221)
    puts "E 006° 59.#{Coords.build(coins: coins, extra: 2)}"
  end
end

coins = Game.start
Game.north(coins)
Game.east(coins)
