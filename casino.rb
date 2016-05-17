# require_relative 'mechanics/dice'
Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file }
require 'pry'


class Casino
	attr_accessor :player

	def initialize
		@player = Player.new
	end

	def pick_game
		puts "What game would you like to play?"
		puts "1: High/Low"
		puts "2: Slots"
		case gets.strip
	    	when '1'
	    		# plays high low
	    		@high_low = HighLow.new
	    		@high_low.deal_cards
	    	when '2'
	    		@slots = Slots.new
	    		@slots.pull
	    	else
	    		puts "Goodbye!"
	    		exit
    	end
    end

    def payout
    	# binding.pry
    	if @high_low
    		if  @high_low.player_wins == true 
    			@player.bank_roll = @player.bank_roll + @high_low.wager 
    			puts "Your new bank roll is #{@player.bank_roll}."
    		elsif @high_low.player_wins == false
    			  @player.bank_roll = @player.bank_roll - @high_low.wager
    			  puts "Your new bank roll is #{@player.bank_roll}."	
    		end
    	elsif @slots
    		if  @slots.player_wins == true
    			@player.bank_roll = @player.bank_roll + @slots.wager 
    			puts "Your new bank roll is #{@player.bank_roll}."
	    	elsif @slots.player_wins == false
	    		  @player.bank_roll = @player.bank_roll - @slots.wager 
	    		  puts "Your new bank roll is #{@player.bank_roll}."
			end
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


class Slots
	attr_accessor :wager, :player_wins

	def initialize
		@wager = 10
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

Casino.new.hit_the_tables
