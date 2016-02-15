# frozen_string_literal: true
class CoinFlipper
  def initialize(coin_set)
    @coin_set = coin_set
  end

  def flip(coin)
    every_nth(@coin_set.coins, coin).each do |c|
      c[0], c[1] = c[1], c[0]
    end
    @coin_set
  end

  private

  def every_nth(array, n)
    (0...array.length).select { |x| x % n == n - 1 }.map { |y| array[y] }
  end
end
