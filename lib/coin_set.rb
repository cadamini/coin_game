# frozen_string_literal: true

require_relative 'coin'

class CoinSet
  attr_reader :coins, :coin_array

  def initialize(coins)
    raise ArgumentError if invalid_input(coins)

    @coins = coins
    @coin_array = (1..coins).map { |i| new_coin(i) }
  end

  private

  def new_coin(number)
    Coin.new(number)
  end

  def invalid_input(coins)
    coins < 1 || coins.is_a?(String)
  end
end
