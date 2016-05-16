# require_relative 'mechanics/dice'
Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file }

# Start game player has a name and an initial bank roll
# Class, instance of a player, pass through name and bank roll (both instance variables)

# Player can go to different games via menu
# Method, display menu, take input and proceed to game

# High / Low
# Class

# Player places bet and wins / loses (hint: rand)
# Player's bankroll goes up and down with wins and losses


# class Player
# 	attr_accessor :name, :bank_roll

# 	def initialize
# 		@name = name
# 		@bank_roll = 200.00
# 	end

# end

class HighLow
	attr_accessor :wager

	def initialize(wager)
		@wager = wager
	end

 	def deal_cards
  	
		cards = Mechanics::Deck.new.cards.shuffle

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
		elsif player_score < dealer_score
			puts "You lose!"
		else
			puts "push"	
		end




		











		# puts you win // you lose
		# puts @wager
		# puts @bank_roll

		# add or subtract from bank roll 
	end  
end

test = HighLow.new(10)
puts test.deal_cards


# class Casino
# 	attr_accessor :player

# 	def initialize
# 		@player = Player.new
# 	end


# 	def pick_game
# 		puts "What game would you like to play?
# 		1: Slots (1.00)
# 		2: High/Low (5.00)"
     

#     case gets.strip
#     	when '1'
#     	# buyer.dishes << High_Low.new("Meatloaf", 5.00)
#     	when '2'
#         buyer.dishes << Dish.new("Mystery Meat", 3.00)