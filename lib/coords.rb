# frozen_string_literal: true

require_relative 'sum_updater.rb'

class Coords
  attr_reader :coin_set

  class << self
    def build(coins:, extra: 0)
      sum = SumUpdater.new
      coins.each { |coin| sum.add(value: coin.value) }
      sum.add(value: extra)
    end
  end
end
