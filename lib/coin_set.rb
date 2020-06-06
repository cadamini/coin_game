# frozen_string_literal: true

require_relative 'coin'

class CoinSet
  attr_reader :number_of_coins, :coins

  def initialize(number_of_coins)
    raise ArgumentError if invalid_input(number_of_coins)

    @number_of_coins = number_of_coins
    @coins = coin_array
  end

  def size
    number_of_coins
  end

  def coin_array
    (0..number_of_coins - 1).map { |i| Coin.new(i + 1) }
  end

  private

  def invalid_input(number_of_coins)
    number_of_coins < 1 || number_of_coins.is_a?(String)
  end
end
