# require_relative 'mechanics/dice'
Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/games/*.rb'].each {|file| require file }
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
	    		payout_high_low
	    	when '2'
	    		@slots = Slots.new
	    		@slots.pull
	    		# help us reset the instance of our game
	    		# because high_low is already instantiated
	    		# so it always hits the 'if' in payout
	    		payout_slots
	    	else
	    		puts "Goodbye!"
	    		exit
    	end
    end

    def payout_high_low
		if @high_low.player_wins == true 
			@player.bank_roll = @player.bank_roll + @high_low.wager 
			printf("Your new bank roll is $%.2f.\n", @player.bank_roll)
		elsif @high_low.player_wins == false
			  @player.bank_roll = @player.bank_roll - @high_low.wager
			  printf("Your new bank roll is $%.2f.\n", @player.bank_roll)
		end
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

  def payout_slots
		if @slots.player_wins == true
			@player.bank_roll = @player.bank_roll + @slots.wager 
			printf("Your new bank roll is $%.2f.\n", @player.bank_roll)
    	elsif @slots.player_wins == false
    		  @player.bank_roll = @player.bank_roll - @slots.wager 
    		  printf("Your new bank roll is $%.2f.\n", @player.bank_roll)
		end
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
    	pick_game
    end
end


class Player
	attr_accessor :name, :bank_roll

	def initialize
		@name = name
		@bank_roll = 200
		intro
	end

	def intro
		puts "Welcome to the casino. What's your name?"
		@name = gets.strip
		printf("Good luck %s, you have $%.2f to play with.\n", @name, @bank_roll)

	end

end

Casino.new.hit_the_tables


# TO DO list
# break out payouts into different methods 
# create a cashier class
# ask for bankroll, set user input equal to bankroll
# dynamic wager (choose how much to bet, give option for all in)
