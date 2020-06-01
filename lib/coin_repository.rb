# frozen_string_literal: true

# TODO: Fix Metrics/CyclomaticComplexity
class CoinRepository
  attr_reader :coin_set, :limited_set

  def initialize(coin_set)
    @coin_set = coin_set
    @limited_set = []
  end

  def find(operator, **coins)
    handle_input_error(coins[:first], *coins[:last])
    coin_set.each do |coin|
      next if coin[0].nil?

      case operator
      when :greater
        limited_set << coin if coin[0] > coins[:first]
      when :smaller
        limited_set << coin if coin[0] < coins[:first]
      when :between
        if coin[0] > coins[:first] && coin[0] < coins[:last]
          limited_set << coin
        end
      end
    end
    limited_set
  end

  private

  def handle_input_error(*coin_numbers)
    if coin_numbers.size == 1
      if coin_numbers[0] > coin_set.size
        raise ArgumentError,
              "Invalid value #{coin_numbers[0]} for greater or smaller, "\
              "Maximum value #{coin_set.size}"
      end
    elsif coin_numbers.size == 2
      if coin_numbers[0] > coin_set.size ||
         coin_numbers[1] > coin_set.size
        raise ArgumentError,
              "Invalid value (#{coin_numbers[0]} or #{coin_numbers[1]})"\
              "for between, Maximum value #{coin_set.size}"
      end
    else
      raise ArgumentError, 'too many arguments, max 2 allowed'
    end
  end
end
