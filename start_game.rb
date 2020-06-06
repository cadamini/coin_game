# frozen_string_literal: true

require_relative 'lib/coords'
require_relative 'lib/coin_repository'
require_relative 'lib/coin_set'
require_relative 'lib/flipper'

set = CoinSet.new(ARGV[0].to_i)
flipped_coins = Flipper.every_nth_coin(set)

# previous result N 448 / E 2

north = CoinRepository.new(flipped_coins)
north.find(:greater, first: 256)
north.find(:smaller, first: 18)
north.find(:between, first: 40, last: 131)
result = Coords.build(coins: north.filtered, extra: 3)
puts "N #{result}"

east = CoinRepository.new(flipped_coins)
east.find(:greater, first: 256)
east.find(:smaller, first: 1)
east.find(:between, first: 121, last: 142)
east.find(:between, first: 199, last: 221)
result = Coords.build(coins: east.filtered, extra: 2)
puts "E #{result}"
