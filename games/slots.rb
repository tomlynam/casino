
class Slots
	attr_accessor :wager, :player_wins

	def initialize
		@wager = wager
	end

	def set_wager(player)
		# binding.pry
		puts "How much would you like to bet?"
		@wager = gets.strip.to_i
		if @wager > player.bank_roll
			puts "Sorry, you cannot bet more than you have."
			set_wager(player)
		else pull
		end
	end

 	def pull
  	
		# generate random number between 0 and 9
		wheel1 = rand(0..9)
		wheel2 = rand(0..9)
		wheel3 = rand(0..9)
		numbers = [wheel1, wheel2, wheel3]
		puts numbers.join(' ')

		# binding.pry
		if numbers.uniq.count == 1
			puts "Jackpot!"
			@player_wins = true
			# maybe also add a bonus here in addition to doubling the wager
		elsif numbers.uniq.count == 2
			puts "Winner winner!"
			@player_wins = true
		else 
			puts "Sorry, not a winner."
			@player_wins = false
		end
		
	end  
end