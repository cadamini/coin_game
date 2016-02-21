class CoinRepository
  attr_reader :coin_set, :limited_set
  def initialize(coin_set)
    @coin_set = coin_set
    @limited_set = []
  end
  def smaller(coin_number)
    coin_set.coins.each do |coin|
      next if coin[0].nil?
        if coin[0] < coin_number
          # or use the number in coin[0] only
          @limited_set << coin
        end
    end
    @limited_set
  end
  def greater(coin_number)
    coin_set.coins.each do |coin|
      next if coin[0].nil?
        if coin[0] > coin_number
          @limited_set << coin
        end
    end
    @limited_set
  end
  def between(smaller_coin, greater_coin)
    coin_set.coins.each do |coin|
      next if coin[0].nil?
        if coin[0] > smaller_coin && coin[0] < greater_coin
          @limited_set << coin
        end
    end
    @limited_set
  end
end
