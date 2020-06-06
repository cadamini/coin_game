# frozen_string_literal: true

class Coin
  attr_accessor :number, :value
  def initialize(number)
    @number = number
    @value = number
  end

  def flip_down
    @value = 0
    self
  end

  def flip_up
    @value = @number
    self
  end  
end
