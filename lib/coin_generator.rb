class CoinGenerator
  attr_reader :number_of_coins, :coins

  def initialize(number_of_coins)
    @number_of_coins = number_of_coins
    @coins = create_coins
  end

  private

  def create_coins
    coins = Array.new(number_of_coins) { Array.new(2) }
    (0..number_of_coins - 1).each do |i|
      coins[i][1] = i + 1
    end
    coins
  end
end
