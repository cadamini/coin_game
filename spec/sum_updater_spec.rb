# frozen_string_literal: true

require 'sum_updater'

RSpec.describe SumUpdater do
  it 'has an initial value' do
    expect(SumUpdater.new.initial_value).to eq 0
  end

  it 'adds a value to the initial value' do
    expect(SumUpdater.new.add(value: 2)).to eq 2
  end
end
