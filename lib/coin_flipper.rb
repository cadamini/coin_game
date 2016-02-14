class CoinFlipper
  def self.flip(coin_set, round)
    coin_set.coins.every_nth(round).each do |coin|
      coin[0], coin[1] = coin[1], coin[0]
    end
    coin_set.coins
  end
end

module Enumerable
  def every_nth(n)
    (0...length).select { |x| x % n == n - 1 }.map { |y| self[y] }
  end
end
