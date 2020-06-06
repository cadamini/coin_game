# frozen_string_literal: true

require 'spec_helper'
require 'coords'
require 'coin_set'
require 'flipper'

RSpec.describe Coords do
  before do
  	@coins = double(
      'visible_coins', 
      result_set: [Coin.new(1), Coin.new(2), Coin.new(3).flip_down]
    )
  end

  it 'builds the sum of visible coin values' do
    expect(Coords.build(coins: @coins.result_set)).to eq 3
  end

  it 'add an extra number on top of the result ' do
    expect(Coords.build(coins: @coins.result_set, extra: 3)).to eq 6
  end
end
