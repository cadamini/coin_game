# frozen_string_literal: true
require 'spec_helper'
require 'coin_set_generator'
require 'coin_flipper'

RSpec.describe CoinFlipper do
  it 'flips a coin' do
    coin_set = CoinSetGenerator.new(3)
    expect(CoinFlipper.flip(coin_set.coins, 2))
      .to eq [[nil, 1], [2, nil], [nil, 3]]
  end
end
