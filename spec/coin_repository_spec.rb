require 'coin_repository'
require 'coin_set_generator'
RSpec.describe CoinRepository do
  it 'get a coin_set' do
    coin_set = [[1, nil], [nil, 2], [3, nil]]
    expect(CoinRepository.new(coin_set).coin_set)
      .to eq [[1, nil], [nil, 2], [3, nil]]
  end
  it 'limits the coin_set to coins smaller x' do
    # stub this ?
    coin_set = CoinSetGenerator.new(3)
    # use flipped coins
    expect(
      CoinRepository.new(coin_set).smaller(2)
      ).to eq []
  end
end
