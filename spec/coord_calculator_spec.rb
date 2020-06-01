# frozen_string_literal: true

require 'spec_helper'
require 'coord_calculator'
require 'coin_set_generator'

RSpec.describe CoordCalculator do
  before do
    @coins = double('visible_coins', limited_set: [[1, nil], [2, nil]])
  end

  it 'builds the sum of visible coin values' do
    expect(CoordCalculator.build_sum(coins: @coins)).to eq 3
  end

  it 'add an extra number on top of the result ' do
    expect(CoordCalculator.build_sum(coins: @coins, extra: 3)).to eq 6
  end
end
