# frozen_string_literal: true

require 'coin_repository'
require 'coin_set'

RSpec.describe CoinRepository do
  let(:five) do
    [Coin.new(1), Coin.new(2), Coin.new(3), Coin.new(4), Coin.new(5)]
  end

  context '#find coins successfully' do
    it 'get a coin set' do
      expect(CoinRepository.new(five).coin_set).to match_array [
        have_attributes(number: 1, value: 1), 
        have_attributes(number: 2, value: 2),
        have_attributes(number: 3, value: 3),
        have_attributes(number: 4, value: 4),
        have_attributes(number: 5, value: 5)
      ]
    end

    it 'gets coins smaller x' do
      expect(
        CoinRepository.new(five).find(:smaller, first: 2)
      ).to match_array [
        have_attributes(number: 1, value: 1)
      ]
    end

    it 'gets coins greater than x' do
      expect(
        CoinRepository.new(five).find(:greater, first: 2)
      ).to match_array [
        have_attributes(number: 3, value: 3),
        have_attributes(number: 4, value: 4),
        have_attributes(number: 5, value: 5)
      ]
    end

    it 'gets coins between x and y' do
      expect(
        CoinRepository.new(five).find(:between, first: 2, last: 5)
      ).to match_array [
        have_attributes(number: 3, value: 3),
        have_attributes(number: 4, value: 4)
      ]
    end
  end
end
