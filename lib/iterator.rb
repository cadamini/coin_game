# frozen_string_literal: true

class Iterator
  attr_reader :coin_set

  def flip_every_nth_coin
    (1..last_coin).each do |iteration|
      flip(coin_set.coins, iteration)
    end
    coin_set.coins
  end

  private

  def initialize(coin_set)
    @coin_set = coin_set
  end

  def flip(coins, iteration)
    every_nth(coins, iteration).each do |coin|
      coin[0], coin[1] = coin[1], coin[0]
    end
    coins
  end

  def every_nth(array, iteration)
    matching_coins = (0...array.length).select do |coin|
      coin % iteration == iteration - 1
    end.map { |value| array[value] }
  end

  def last_coin
    coin_set.total_coins
  end
end
