# frozen_string_literal: true

class Flipper
  def self.every_nth_coin(coin_set)
    (1..coin_set.number_of_coins).map do |i| 
      flip(coin_set.coins, i)
    end
    coin_set.coins
  end

  private

  def self.flip(coins, i)
    every_nth(coins, i).map! do |coin|
      if coin.value == coin.number
        coin.flip_down
      else
        coin.flip_up
      end
    end
  end

  def self.every_nth(array, i)
    (0...array.length).select do |coin|
      coin % i == i - 1
    end.map { |value| array[value] }
  end
end
