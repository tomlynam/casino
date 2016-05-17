
class HighLow
	attr_accessor :wager, :player_wins

	def initialize
		@wager = 10
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