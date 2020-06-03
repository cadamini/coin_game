# frozen_string_literal: true

require 'coin_repository'
require 'coin_set'

RSpec.describe CoinRepository do
  let(:five) do
    [[1, nil], [nil, 2], [3, nil], [4, nil], [5, nil]]
  end

  context '#find coins successfully' do
    it 'get a coin set' do
      expect(CoinRepository.new(five).coin_set)
        .to eq [[1, nil], [nil, 2], [3, nil], [4, nil], [5, nil]]
    end

    it 'gets coins smaller x' do
      expect(
        CoinRepository.new(five).find(:smaller, first: 2)
      ).to eq [[1, nil]]
    end

    it 'gets coins greater than x' do
      expect(
        CoinRepository.new(five).find(:greater, first: 2)
      ).to eq [[3, nil], [4, nil], [5, nil]]
    end

    it 'gets coins between x and y' do
      expect(
        CoinRepository.new(five).find(:between, first: 2, last: 5)
      ).to eq [[3, nil], [4, nil]]
    end
  end
end
