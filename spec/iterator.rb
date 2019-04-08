# frozen_string_literal: true
require 'spec_helper'
require 'coin_set_generator'

RSpec.describe Iterator do
  it 'iterates over the coins' do
    coin_set = CoinSetGenerator.new(2)
    expect(Iterator.execute(coin_set)).to eq [[1, nil], [nil, 2]]
  end
end
