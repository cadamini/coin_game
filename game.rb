require_relative 'lib/coin_generator'
require_relative 'lib/coin_flipper'

sum_north = 0
sum_east = 0

coins = 256
coin_set = CoinGenerator.new(coins)

result = []
(1..coins).each do |round|
  result = CoinFlipper.flip(coin_set, round)
end

result.each do |coin|
  next if coin[0].nil?

  print "Coin: #{coin[0]}"

  if coin[0] <= 17 || (coin[0] >= 41 && coin[0] <= 131)
    puts '(N)'
    sum_north += coin[0]

  elsif (coin[0] >= 122 && coin[0] <= 141) ||
        (coin[0] >= 200 && coin[0] <= 220)
    puts '(E)'
    sum_east += coin[0]

  else
    puts ''
  end
end

puts "Total North: #{sum_north}"
puts "Total East: #{sum_east}"

puts 'Adding 3 to north.'
sum_north += 3
puts 'Adding 2 to east.'
sum_east += 2

puts "Sum north: #{sum_north}"
puts "Sum east: #{sum_east}"

puts "N 51° 27.#{sum_north} E 006° 59.#{sum_east}"
