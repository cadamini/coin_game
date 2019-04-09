# frozen_string_literal: true

require 'coin_repository'
require 'coin_set_generator'

# TODO: Fix Metrics/BlockLength

RSpec.describe CoinRepository do
  let(:two_coins) { [[1, nil], [nil, 2]] }
  let(:three_coins) { [[1, nil], [nil, 2], [3, nil]] }
  let(:five_coins) do
    [[1, nil], [nil, 2], [3, nil], [4, nil], [5, nil]]
  end

  context '#find coins successfully' do
    it 'get a coin set' do
      expect(CoinRepository.new(three_coins).coin_set)
        .to eq [[1, nil], [nil, 2], [3, nil]]
    end

    it 'gets coins smaller x' do
      expect(
        CoinRepository.new(three_coins).find(:smaller, first: 2)
      ).to eq [[1, nil]]
    end

    it 'gets coins greater than x' do
      expect(
        CoinRepository.new(three_coins).find(:greater, first: 2)
      ).to eq [[3, nil]]
    end

    it 'gets coins between x and y' do
      expect(
        CoinRepository.new(five_coins).find(:between, first: 2, last: 5)
      ).to eq [[3, nil], [4, nil]]
    end
  end

  context '#raise error' do
    it 'gets a value greater than total coins' do
      expect do
        CoinRepository.new(two_coins).find(:greater, first: 3)
      end.to raise_error ArgumentError
    end

    it 'gets a value smaller than total coins' do
      expect do
        CoinRepository.new([]).find(:smaller, first: 1)
      end.to raise_error ArgumentError
    end

    context '#between' do
      before do
        @two_coin_repo = CoinRepository.new(two_coins)
      end

      it 'gets a second value which is greater than the last index' do
        expect do
          @two_coin_repo.find(:between, first: 2, last: 5)
        end.to raise_error ArgumentError
      end

      it 'gets a first value which is before the first index' do
        expect do
          @two_coin_repo.find(:between, first: -1, last: 5)
        end.to raise_error ArgumentError
      end
    end
  end
end
