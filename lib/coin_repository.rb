# frozen_string_literal: true

class CoinRepository
  attr_reader :coin_set, :result_set

  def initialize(coin_set)
    @coin_set = coin_set
    @result_set = []
  end

  def find(operator, **coins)
    coin_set.each do |coin|
      next if coin[0].nil?

      case operator
      when :greater
        result_set << coin if coin[0] > coins[:first]
      when :smaller
        result_set << coin if coin[0] < coins[:first]
      when :between
        result_set << coin if coin[0] > coins[:first] && coin[0] < coins[:last]
      end
    end
    result_set
  end
end
