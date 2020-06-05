# frozen_string_literal: true

require_relative 'lib/coords'
require_relative 'lib/coin_repository'
require_relative 'lib/coin_set'
require_relative 'lib/flipper'

set = CoinSet.new(ARGV[0].to_i)
flipped_coins = Flipper.new(set).every_nth_coin

# previous result 
# N 51° 27.04480
# E 006° 59.020

north = CoinRepository.new(flipped_coins)
north.find(:greater, first: 256)
north.find(:smaller, first: 18)
north.find(:between, first: 40, last: 131)
puts "N 51° 27.#{Coords.build(coins: north.result_set, extra: 3)}"

east = CoinRepository.new(flipped_coins)
east.find(:greater, first: 256)
east.find(:smaller, first: 1)
east.find(:between, first: 121, last: 142)
east.find(:between, first: 199, last: 221)
puts "E 006° 59.#{Coords.build(coins: east.result_set, extra: 2)}"
