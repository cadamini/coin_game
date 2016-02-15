# frozen_string_literal: true
require 'spec_helper'
require 'coin_set_handler'

RSpec.describe CoinSetHandler do
  before do
    @coin_set = CoinSetHandler.new(2)
  end

  it 'is a coin generator' do
    expect(@coin_set).to be_a(CoinSetHandler)
  end

  it 'generates a number of coins' do
    expect(@coin_set.number_of_coins).to eq 2
  end

  it 'creates the correct numbers on the coins' do
    expect(@coin_set.coins).to eq [[nil, 1], [nil, 2]]
  end

  it 'iterates over the coins' do
    new_coin_set = @coin_set.iterate
    expect(new_coin_set.coins).to eq [[1, nil], [nil, 2]]
  end
end
