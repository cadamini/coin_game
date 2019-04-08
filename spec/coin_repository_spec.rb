# frozen_string_literal: true

require 'coin_repository'
require 'coin_set_generator'

RSpec.describe CoinRepository do

  context '#find coins successfully' do 
    it 'get a coin set' do
      coin_set = [[1, nil], [nil, 2], [3, nil]]
      expect(CoinRepository.new(coin_set).coin_set)
        .to eq [[1, nil], [nil, 2], [3, nil]]
    end

    it 'gets coins smaller x' do
      coin_set = [[1, nil], [nil, 2], [3, nil]]
      expect(CoinRepository.new(coin_set).find(:smaller, first: 2)).to eq [[1, nil]]
    end

    it 'gets coins greater than x' do
      coin_set = [[1, nil], [nil, 2], [3, nil]]
      expect(CoinRepository.new(coin_set).find(:greater, first: 2)).to eq [[3, nil]]
    end

    it 'gets coins between x and y' do
      coin_set = [[1, nil], [nil, 2], [3, nil], [4, nil], [5, nil]]
      expect(
        CoinRepository.new(coin_set).find(:between, first: 2, last: 5)
      ).to eq [[3, nil], [4, nil]]
    end
  end
  
  context '#raise error' do
    it 'raises if input is smaller than total' do
      coin_set = [[1, nil], [nil, 2]]
      expect { 
        CoinRepository.new(coin_set).find(:between, first: 2, last: 5) 
      }.to raise_error
    end

    it 'is raises an error if input is smaller or greater than total number of coins ' do
      coin_set = [[1, nil], [nil, 2]]
      expect { 
        CoinRepository.new(coin_set).find(:greater, first: 3) 
      }.to raise_error
    end

    it 'is raises an error if input is smaller or greater than total number of coins ' do
      coin_set = []
      expect { 
        CoinRepository.new(coin_set).find(:smaller, first: 1)
      }.to raise_error
    end
  end
end
