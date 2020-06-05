# frozen_string_literal: true

class Coin
  attr_accessor :number, :value
  def initialize(number)
    @number = number
    @value = number
  end
end
