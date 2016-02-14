require 'spec_helper'
require 'coin_generator'
require 'coin_flipper'

RSpec.describe CoinFlipper do
  it 'flips all coins in the first round' do
    coin_set = CoinGenerator.new(4)
    round = 1
    expect(CoinFlipper.flip(coin_set, round))
      .to eq [[1, nil], [2, nil], [3, nil], [4, nil]]
  end

  it 'flipps every 4th coin in the fourth round' do
    coin_set = CoinGenerator.new(4)
    round = 4
    expect(CoinFlipper.flip(coin_set, round))
      .to eq [[nil, 1], [nil, 2], [nil, 3], [4, nil]]
  end
end
