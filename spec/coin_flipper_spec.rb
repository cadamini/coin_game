# frozen_string_literal: true
require 'spec_helper'
require 'coin_set_handler'
require 'coin_flipper'

RSpec.describe CoinFlipper do
  it 'flips all coins in the first round' do
    coin_set = CoinSetHandler.new(4)
    round = 1
    expect(CoinFlipper.new(coin_set).flip(round))
      .to eq coin_set
  end

  it 'flipps every 4th coin in the fourth round' do
    coin_set = CoinSetHandler.new(4)
    round = 4
    expect(CoinFlipper.new(coin_set).flip(round))
      .to eq coin_set
  end
end
