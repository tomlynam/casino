
class HighLow
	attr_accessor :wager, :player_wins

	def initialize
		@wager = 10
	end

 	def deal_cards
  	
		cards = Mechanics::Deck.new.cards
		cards = cards.shuffle

		# player card is dealt
		player_card = cards.first
		puts "Your Card: " + player_card.rank

		#display index position of player card in rank array
		player_score =  Mechanics::Deck.find_card(player_card)

		# dealer card is dealt
		dealer_card = cards.last
		puts "Dealer Card: " + dealer_card.rank

		#display index position of dealer card in rank array
		dealer_score =  Mechanics::Deck.find_card(dealer_card)

		#compare index positions to determine win/loss
		if player_score > dealer_score
			puts "You win!"
			# calculate winnings
			@player_wins = true
		elsif player_score < dealer_score
			puts "You lose!"
			# calculate new bankroll (with less)
			@player_wins = false
		else
			puts "push"	
			# restarts game
		end
	end  
end