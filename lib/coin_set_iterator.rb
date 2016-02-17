# frozen_string_literal: true
class CoinSetIterator
  attr_reader :coin_set

  def self.execute(coin_set)
    (1..coin_set.number_of_coins).each do |iteration|
      CoinFlipper.flip(coin_set.coins, iteration)
    end
    self
  end
end
