# frozen_string_literal: true

class CoinRepository
  attr_reader :coin_set, :result_set

  def initialize(coin_set)
    @coin_set = coin_set
    @result_set = []
  end

  def find(operator, **coins)
    coin_set.each do |coin|
      next if coin.value.nil?

      case operator
      when :greater
        result_set << coin if coin.value > coins[:first]
      when :smaller
        result_set << coin if coin.value < coins[:first]
      when :between
        result_set << coin if coin.value > coins[:first] && coin.value < coins[:last]
      end
    end
    result_set
  end
end
