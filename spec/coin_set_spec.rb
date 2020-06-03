# frozen_string_literal: true

require 'spec_helper'
require 'coin_set'

RSpec.describe CoinSet do
  it 'is a coin generator' do
    expect(CoinSet.new(1)).to be_a(CoinSet)
  end

  it 'generates a number of coins' do
    coinset = CoinSet.new(2201)
    expect(coinset.amount).to eq 2201
  end

  it 'cannot create a zero coin coinset' do
    expect{ CoinSet.new(0) }.to raise_error ArgumentError
  end

  it 'creates coins' do
    coinset = CoinSet.new(3)
    expect(coinset.create).to eq [[nil, 1], [nil, 2], [nil, 3]]
  end

  describe 'raise error when input' do
    it 'is called with negative integer value' do
      expect { CoinSet.new(-1) }
        .to raise_error ArgumentError
    end
    it 'is called with a character' do
      expect { CoinSet.new('a') }
        .to raise_error ArgumentError
    end
  end
end
