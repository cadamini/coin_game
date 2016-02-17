# frozen_string_literal: true
require_relative 'coin_set_generator'
require_relative 'coin_flipper'
require_relative 'coord_calculator'
require_relative 'coin_set_iterator'

class Game
  def self.start(coin_set_size)
    coin_set = CoinSetGenerator.new(coin_set_size)
    CoinSetIterator.execute(coin_set)
    CoordCalculator.run(coin_set)
  end
end
