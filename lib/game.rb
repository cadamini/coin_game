require_relative 'coords'
require_relative 'coin_filter'
require_relative 'coin_set'
require_relative 'flipper'

class Game
	def initialize(number_of_coins)
		@number_of_coins = number_of_coins
		start_game
	end

	def start_game
		flipped_coins = Flipper.every_nth_coin(coin_set)
		north_coordinate(flipped_coins)
		east_coordinate(flipped_coins)		
	end

	private

	def coin_set
		CoinSet.new(@number_of_coins)
	end

	def east_coordinate(flipped_coins)
		east = CoinFilter.new(flipped_coins)
		east.find(:greater, first: 256)
		east.find(:smaller, first: 1)
		east.find(:between, first: 121, last: 142)
		east.find(:between, first: 199, last: 221)

		## debug
		# sum = 0
		# east.filtered.each do |coin| 
		#   sum += coin.value
		#   p "#{coin.number}: #{sum}"
		# end

		puts "E #{Coords.build(coins: east.filtered, extra: 2)}"
	end

	def north_coordinate(flipped_coins)
		north = CoinFilter.new(flipped_coins)
		north.find(:greater, first: 256)
		north.find(:smaller, first: 18)
		north.find(:between, first: 40, last: 131)

		## debug
		# sum = 0
		# north.filtered.each do |coin| 
		#   sum += coin.value
		#   p "#{coin.number}: #{sum}"
		# end

		puts "N #{Coords.build(coins: north.filtered, extra: 3)}"
	end
end