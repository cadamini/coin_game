# frozen_string_literal: true

require 'spec_helper'
require 'coin_set'
require 'iterator'

RSpec.describe Iterator do
  it 'iterates over the coins' do
    coin_set = CoinSet.new(2)
    expect(
      Iterator.new(coin_set).flip_every_nth_coin
    ).to eq [[1, nil], [nil, 2]]
  end
end
