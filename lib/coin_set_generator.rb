# frozen_string_literal: true

require_relative 'coin'

class CoinSet
  attr_reader :total_coins, :coins

  def initialize(total_coins)
    @total_coins = total_coins
    @coins = create_coins
  end

  def create_coins
    handle_wrong_inputs

    (0..total_coins - 1).map do |i|
      coin = Coin.new
      [coin.heads, coin.tail = i + 1]
    end
  end

  private

  def handle_wrong_inputs
    raise ArgumentError, 'Enter an integer > 0 to start the game.' if coin_input_nil_or_negative?
  end

  def coin_input_nil_or_negative?
    total_coins.nil? || total_coins < 1
  end
end
