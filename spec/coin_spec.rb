# frozen_string_literal: true

require 'spec_helper'
require 'coin'

RSpec.describe Coin do
  it 'has heads' do
    coin = Coin.new
    expect(coin.heads).to eq nil
  end

  it 'has tails' do
    coin = Coin.new
    expect(coin.tails).to eq 0
  end
end
