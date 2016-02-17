# frozen_string_literal: true
class CoinFlipper
  class << self
    def flip(coins, iteration)
      every_nth(coins, iteration).each do |c|
        c[0], c[1] = c[1], c[0]
      end
      coins
    end

    private

    def every_nth(array, n)
      (0...array.length).select { |x| x % n == n - 1 }.map { |y| array[y] }
    end
  end
end
