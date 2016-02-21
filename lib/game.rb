# frozen_string_literal: true
require_relative 'coin_set_generator'
require_relative 'coin_flipper'
require_relative 'coord_calculator'
require_relative 'coin_set_iterator'
require_relative 'coin_repository'

class Game
  def self.start(coin_set_size)
    coin_set = CoinSetGenerator.new(coin_set_size)
    CoinSetIterator.execute(coin_set)

    coins_for_north = CoinRepository.new(coin_set)
    coins_for_north.smaller(18)
    coins_for_north.between(40, 131)

    coins_for_east = CoinRepository.new(coin_set)
    coins_for_east.between(121, 142)
    coins_for_east.between(199, 221)

    CoordCalculator.run(
      coins_for_north.limited_set,
      coins_for_east.limited_set
    )
  end
end
