# frozen_string_literal: true

require_relative 'sum_updater.rb'

class CoordCalculator
  attr_reader :coin_set

  class << self
    def build_sum(coins:, extra:)
      sum = SumUpdater.new
      coins.limited_set.each do |coin|
        sum.add(value: coin[0])
      end
      sum.add(value: extra)
    end
  end
end
