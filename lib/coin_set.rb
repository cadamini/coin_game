# frozen_string_literal: true

require_relative 'coin'

class CoinSet
  attr_reader :amount, :coins

  def initialize(amount)
    raise ArgumentError if invalid_input(amount)
    @amount = amount
    @coins = coin_array
  end

  def coin_array
    coin = Coin.new
    (0..amount - 1).map { |i| [coin.heads, coin.tails = i + 1] }
  end

  private

  def invalid_input(amount)
    amount < 1 || amount.kind_of?(String)
  end
end
