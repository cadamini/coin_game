# frozen_string_literal: true

class CoinRepository
  attr_reader :coin_set, :filtered

  def initialize(coin_set)
    @coin_set = coin_set
    @filtered = []
  end

  def find(operator, **coins)
    coin_set.each do |coin|
      next if coin.value.nil?

      case operator
      when :greater
        filtered << coin if coin.value > coins[:first]
      when :smaller
        filtered << coin if coin.value < coins[:first]
      when :between
        filtered << coin if coin.value > coins[:first] && coin.value < coins[:last]
      end
    end
    filtered
  end
end
