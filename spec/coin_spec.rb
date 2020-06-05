# frozen_string_literal: true

require 'spec_helper'
require 'coin'

RSpec.describe Coin do
  it 'has a default value' do
    coin = Coin.new(256)
    expect(coin.value).to eq 256
  end

  it 'has a number' do
    coin = Coin.new(256)
    expect(coin.number).to eq 256
  end
end
