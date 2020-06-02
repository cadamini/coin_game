# frozen_string_literal: true

require_relative 'lib/coords'
require_relative 'lib/coin_repository'
require_relative 'lib/coin_set'
require_relative 'lib/flipper'

coins = ARGV[0].to_i

set = CoinSet.new(coins)
coins = Flipper.new(set).every_nth_coin

coin_set = CoinRepository.new(coins)
coin_set.find(:greater, first: 256)
coin_set.find(:smaller, first: 18)
coin_set.find(:between, first: 40, last: 131)
puts "N 51° 27.#{Coords.build(coins: coin_set, extra: 3)}"

coin_set = CoinRepository.new(coins)
coin_set.find(:greater, first: 256)
coin_set.find(:smaller, first: 1)
coin_set.find(:between, first: 121, last: 142)
coin_set.find(:between, first: 199, last: 221)
puts "E 006° 59.#{Coords.build(coins: coin_set, extra: 2)}"