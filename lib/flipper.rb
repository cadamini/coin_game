# frozen_string_literal: true

class Flipper
  attr_reader :coin_set

  def every_nth_coin
    (1..coin_set.number_of_coins).map do |i| 
      flip(coin_set.coins, i)
    end
    coin_set.coins
  end

  private

  def initialize(coin_set)
    @coin_set = coin_set
  end
  #.select.with_index{|_,i| (i+1) % 2 == 0}
  def flip(coins, i)
    every_nth(coins, i).each do |coin|
      if coin.value == coin.number
        coin.value = 0
        p "#{coin.number}: #{coin.value}"
      else
        coin.value = coin.number
        p "#{coin.number}: #{coin.value}"
      end
    end

    coins
  end

  def every_nth(array, i)
    (0...array.length).select do |coin|
      coin % i == i - 1
    end.map { |value| array[value] }
  end
end
