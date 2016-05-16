# require_relative 'mechanics/dice'
Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file }

# class Casino
# 	include Mechanics

# 	def play
# 		puts Mechanics::Dice.roll
# 		cards = Mechanics::Deck.new.cards
# 		cards.each do |card|
# 			puts "#{card.rank} of #{card.suit}"
# 		end
# 	end

# end

# @game = Casino.new
# @game.play



# Start game player has a name and an initial bank roll
# Class, instance of a player, pass through name and bank roll (both instance variables)


# Player can go to different games via menu
# Method, display menu, take input and proceed to game


# High / Low
# Class


# Player places bet and wins / loses (hint: rand)
# Player's bankroll goes up and down with wins and losses




# class Player
#   attr_accessor :name, :bank_roll

#   def initialize
#     @name = []
#     @bank_roll = 200.00
#   end

# end

class High_Low
  attr_accessor :wager

  def initialize(wager)
  	@wager = wager
    # @name = name
    # @price = price
  end

  def deal_cards
  	# player card is dealt
  	# dealer card is dealt
  	# compare ranks
  	# puts you win // you lose
  	# add or subtract from bank roll 
		cards = Mechanics::Deck.new.cards.shuffle
		puts cards.first.rank
		puts cards.last.rank
		# cards.each do |card|
		# 	puts "#{card.rank} of #{card.suit}"
		# end
	end
  
end

test = High_Low.new(10)
puts test.deal_cards


# class Casino
#   attr_accessor :player

#   def initialize
#     @player = Player.new
#   end

#   def pick_game
#     puts "What game would you like to play?
#       1: Slots (1.00)
#       2: High/Low (5.00)"
     

#     case gets.strip
#       when '1'
#         # buyer.dishes << Dish.new("Meatloaf", 5.00)
#       when '2'
        # buyer.dishes << Dish.new("Mystery Meat", 3.00)