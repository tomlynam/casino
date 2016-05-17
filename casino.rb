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
	    	when '2'
	    		@slots = Slots.new
	    		@slots.pull
	    		# help us reset the instance of our game
	    		# because high_low is already instantiated
	    		# so it always hits the 'if' in payout
	    		@high_low = nil
	    	else
	    		puts "Goodbye!"
	    		exit
    	end
    end

    def payout
    	if @high_low
    		if @high_low.player_wins == true 
    			@player.bank_roll = @player.bank_roll + @high_low.wager 
    			puts "Your new bank roll is #{@player.bank_roll}."
    		elsif @high_low.player_wins == false
    			  @player.bank_roll = @player.bank_roll - @high_low.wager
    			  puts "Your new bank roll is #{@player.bank_roll}."	
    		end
    	else @slots
    		if @slots.player_wins == true
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
    	pick_game
    	payout
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

Casino.new.hit_the_tables
