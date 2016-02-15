# frozen_string_literal: true
require_relative 'lib/coin_set_handler'
require_relative 'lib/coin_flipper'
require_relative 'lib/coord_calculator'

coin_set = CoinSetHandler.new(256)
coin_set.iterate
last_coin_set = CoordCalculator.new(last_coin_set: coin_set)
last_coin_set.calculate_coordinates
