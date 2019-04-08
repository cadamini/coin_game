# frozen_string_literal: true
class SumUpdater
  attr_reader :initial_value
  def initialize
    @initial_value = 0
  end

  def add(value:)
    @initial_value += value
    @initial_value
  end
end
