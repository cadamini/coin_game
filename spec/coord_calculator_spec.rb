# frozen_string_literal: true
require 'spec_helper'
require 'coord_calculator'

RSpec.describe CoordCalculator do
  before do
    @coin_set = CoinSetHandler.new(2)
    allow($stdout).to receive(:write) # supress console output
  end

  it 'is a coin generator' do
    expect(CoordCalculator.new(last_coin_set: @coin_set))
      .to be_a(CoordCalculator)
  end

  it 'calculates the coordinates' do
    allow(@coin_set).to receive(:coins).and_return([[1, nil], [nil, 1]])
    calculator = CoordCalculator.new(last_coin_set: @coin_set)
    calculator.calculate_coordinates
    expect(calculator.sum_north).to eq 4
  end
end
