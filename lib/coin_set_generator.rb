# frozen_string_literal: true

require_relative 'coin'

class CoinSet
  attr_reader :total_coins, :coins

  def initialize(total_coins)
    @total_coins = total_coins
    @coins = create_coins
  end

  def create_coins
    raise ArgumentError, 'Enter an integer > 0 for coins.' if nil_or_negative?

    (0..total_coins - 1).map do |i|
      coin = Coin.new
      [coin.heads, coin.tail = i + 1]
    end
  end

  private

  def nil_or_negative?
    total_coins.nil? || total_coins < 1
  end
end
