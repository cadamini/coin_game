require_relative 'lib/coin_generator'
require_relative 'lib/coin_flipper'

coins = 256
coin_set = CoinGenerator.new(coins)

result = []
(1..coins).each do |round|
  result = CoinFlipper.flip(coin_set, round)
end

sum_north = 0
sum_east = 0

result.each do |element|

  # at startup the first value was nil, so not nil is a turned coin
  unless element[0].nil?

    # only certain coins for north
    sum_north += element[0] if element[0] <= 17 ||
                               (element[0] >= 41 && element[0] <= 131)

    # only certain coins for east
    sum_east += element[0] if (element[0] >= 122 && element[0] <= 141) ||
                              (element[0] >= 200 && element[0] <= 220)
  end
end

# post calculations if required
sum_north += 3
sum_east += 2

puts "sum north: #{sum_north}"
puts "sum east: #{sum_east}"
puts "N 51° 27.#{sum_north} E 006° 59.#{sum_east}"
