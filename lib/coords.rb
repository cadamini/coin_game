# frozen_string_literal: true

require_relative 'sum_updater.rb'

class Coords
  attr_reader :coin_set

  class << self
    def build(coins:, extra: 0)
      sum = SumUpdater.new
      coins.result_set.each do |coin|
        sum.add(value: coin[0])
      end
      sum.add(value: extra)
    end
  end
end
