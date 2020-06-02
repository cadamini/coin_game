# frozen_string_literal: true

require_relative 'lib/coords'
require_relative 'lib/coin_repository'
require_relative 'lib/coin_set'
require_relative 'lib/flipper'

coins = ARGV[0].to_i

set = CoinSet.new(coins)
coins = Flipper.new(set).every_nth_coin

north = CoinRepository.new(coins)
north.find(:greater, first: 256)
north.find(:smaller, first: 18)
north.find(:between, first: 40, last: 131)
puts "N 51° 27.#{Coords.build(coins: north, extra: 3)}"

east = CoinRepository.new(coins)
east.find(:greater, first: 256)
east.find(:smaller, first: 1)
east.find(:between, first: 121, last: 142)
east.find(:between, first: 199, last: 221)
puts "E 006° 59.#{Coords.build(coins: east, extra: 2)}"