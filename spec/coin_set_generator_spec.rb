# frozen_string_literal: true
require 'spec_helper'
require 'coin_set_generator'

RSpec.describe CoinSetGenerator do
  before do
    @generator = CoinSetGenerator.new(2)
  end

  it 'is a coin generator' do
    expect(@generator).to be_a(CoinSetGenerator)
  end

  it 'generates a number of coins' do
    expect(@generator.number_of_coins).to eq 2
  end

  it 'creates the correct numbers on the coins' do
    expect(@generator.coins).to eq [[nil, 1], [nil, 2]]
  end

  describe 'raise error when input' do
    it 'is called with negative integer value' do
      expect { CoinSetGenerator.new(-1) }
        .to raise_error InValidInputError
    end
    it 'is called with a character' do
      expect { CoinSetGenerator.new('a') }
        .to raise_error InValidInputError
    end
  end
end
