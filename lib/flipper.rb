# frozen_string_literal: true

class Flipper
  def self.every_nth_coin(coin_set)
    (1..coin_set.coins).map do |iteration|
      flip(coin_set.coin_array, iteration)
    end
    coin_set.coin_array
  end

  def self.flip(coins, iteration)
    every_nth(coins, iteration).map! do |coin|
      if coin.value == coin.number
        coin.flip_down
      else
        coin.flip_up
      end
    end
  end

  def self.every_nth(array, iteration)
    (0...array.length).select do |coin|
      coin % iteration == iteration - 1
    end.map { |value| array[value] }
  end
end
