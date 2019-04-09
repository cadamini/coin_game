# frozen_string_literal: true

require 'spec_helper'
require 'coin'

RSpec.describe Coin do
  it 'has two sides' do
    coin = Coin.new
    expect(coin.heads).to eq nil
    expect(coin.tail).to eq 0
  end
end
