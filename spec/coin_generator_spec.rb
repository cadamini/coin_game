require 'spec_helper'
require 'coin_generator'

RSpec.describe CoinGenerator do
  before do
    @coin_set = CoinGenerator.new(2)
  end

  it 'is a coin generator' do
    expect(@coin_set).to be_a(CoinGenerator)
  end

  it 'generates a number of coins' do
    expect(@coin_set.number_of_coins).to eq 2
  end

  it 'puts the correct numbers on the coins' do
    expect(@coin_set.coins).to eq [[2, 1], [1, 2]]
  end
end
