# frozen_string_literal: true
require 'spec_helper'
require 'coord_calculator'

RSpec.describe CoordCalculator do
  before do
    @coin_set = CoinSet.new(2)
    allow($stdout).to receive(:write) # supress console output
  end
  # TODO: new tests required
end
