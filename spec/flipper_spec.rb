# frozen_string_literal: true

require 'spec_helper'
require 'coin_set'
require 'flipper'

RSpec.describe Flipper do
  it 'iterates over the coins' do
    coin_set = CoinSet.new(4)
    expect(
      Flipper.every_nth_coin(coin_set)
    ).to match_array [
      have_attributes(number: 1, value: 0), 
      have_attributes(number: 2, value: 2),
      have_attributes(number: 3, value: 3),
      have_attributes(number: 4, value: 0)
    ]
  end
end
