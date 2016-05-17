
class HighLow
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
		else deal_cards
		end
	end

 	def deal_cards
  	
		cards = Mechanics::Deck.new.cards
		cards = cards.shuffle

		player_card = cards.first
		puts "Your Card: " + player_card.rank
		player_score =  Mechanics::Deck.find_card(player_card)

		dealer_card = cards.last
		puts "Dealer Card: " + dealer_card.rank
		dealer_score =  Mechanics::Deck.find_card(dealer_card)

		if player_score > dealer_score
			puts "You win!"
			@player_wins = true
		elsif player_score < dealer_score
			puts "You lose!"
			@player_wins = false
		else
			puts "push"	
			# restarts game
		end
	end 
end