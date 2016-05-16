# require_relative 'mechanics/dice'
Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file }
require 'pry'

# Start game player has a name and an initial bank roll
# Class, instance of a player, pass through name and bank roll (both instance variables)

# Player can go to different games via menu
# Method, display menu, take input and proceed to game

# High / Low
# Class

# Player places bet and wins / loses (hint: rand)
# Player's bankroll goes up and down with wins and losses


class Player
	attr_accessor :name, :bank_roll

	def initialize
		@name = name
		@bank_roll = 200.00
		intro
	end

	def intro
		puts "Welcome to the casino. What's your name?"
		@name = gets.strip
		# TODO number to currency
		puts "Good luck #{@name}, you have #{@bank_roll} to play with."
	end

end

# Player.new.intro


class HighLow
	attr_accessor :wager

	
	def initialize
		@wager = 10
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


		# puts @wager
		# puts @bank_roll

		# add or subtract from bank roll 
	end  
end

# test = HighLow.new(10)
# puts test.deal_cards


class Casino
	attr_accessor :player

	def initialize
		@player = Player.new
	end

	def pick_game
		puts "What game would you like to play?
		1: High/Low"
		# 2: Slots
		case gets.strip
	    	when '1'
	    		# plays high low
	    		@high_low = HighLow.new
	    		@high_low.deal_cards
	    	# when '2'
	    	# 	# new instance of slots
	    	else
	    		puts "Goodbye!"
	    		exit

    	end
    end

    def payout
    	# binding.pry
    	if @player_wins == true
    		@player.bank_roll = @player.bank_roll + @high_low.wager
    		puts "Your new bank roll is #{@player.bank_roll}."
    	else 
    		@player.bank_roll = @player.bank_roll - @high_low.wager
    		puts "Your new bank roll is #{@player.bank_roll}."
    	end
    	#bank_roll == 0 ? exit : 
    	if @player.bank_roll == 0 
    		exit(0) 
    	end

    	puts "Would you like to play again? (y/n)"
		user_input = gets.strip.downcase
		# TODO put this on one line
		if user_input == 'y'
			hit_the_tables
		else
		end
    end

    	
    def hit_the_tables
    	# play game
    	pick_game
    	# update bankroll, give option to play again
    	payout
    	# exit if bankroll is 0 or user types exit
    end

end

Casino.new.hit_the_tables
