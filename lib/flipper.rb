# frozen_string_literal: true

class Flipper
  attr_reader :coin_set

  def every_nth_coin
    (1..last_coin).map { |i| flip(coin_set.coins, i) }
    coin_set.coins
  end

  private

  def initialize(coin_set)
    @coin_set = coin_set
  end

  def flip(coins, i)
    every_nth(coins, i).each do |coin|
      coin[0], coin[1] = coin[1], coin[0]
    end
    coins
  end

  def every_nth(array, i)
    (0...array.length).select do |coin|
      coin % i == i - 1
    end.map { |value| array[value] }
  end

  def last_coin
    coin_set.amount
  end
end
