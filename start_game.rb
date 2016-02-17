# frozen_string_literal: true
require_relative 'lib/game.rb'

if ARGV[0].nil?
  puts 'Enter a positive integer as parameter to start the game.'
else
  number_of_coins = ARGV[0].to_i
  Game.start(number_of_coins)
end
