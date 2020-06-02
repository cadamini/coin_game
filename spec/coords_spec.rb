# frozen_string_literal: true

require 'spec_helper'
require 'coords'
require 'coin_set'

RSpec.describe Coords do
  before do
    @coins = double('visible_coins', result_set: [[1, nil], [2, nil]])
  end

  it 'builds the sum of visible coin values' do
    expect(Coords.build(coins: @coins.result_set)).to eq 3
  end

  it 'add an extra number on top of the result ' do
    expect(Coords.build(coins: @coins.result_set, extra: 3)).to eq 6
  end
end
