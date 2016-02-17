# frozen_string_literal: true
class SumUpdater
  attr_reader :sum_north, :sum_east

  def initialize(initial_north:, initial_east:)
    @sum_north = initial_north
    @sum_east = initial_east
  end

  def modify_north(value:)
    @sum_north += value
  end

  def modify_east(value:)
    @sum_east += value
  end
end
