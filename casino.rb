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
	    		@high_low = HighLow.new
	    		@high_low.deal_cards
	    		Cashier.payout_high_low(@high_low, @player)
	    	when '2'
	    		@slots = Slots.new
	    		@slots.pull
	    		Cashier.payout_slots(@slots, @player)
	    	else
	    		puts "Goodbye!"
	    		exit
    	end
    	play_again
    end

	def play_again
	    puts "Would you like to play again? (y/n)"
		user_input = gets.strip.downcase
		hit_the_tables if user_input == 'y'
	end

    def hit_the_tables
    	pick_game
    end

  #   def payout_high_low
		# if @high_low.player_wins == true 
		# 	@player.bank_roll = @player.bank_roll + @high_low.wager
		# 	printf("Your new bank roll is $%.2f.\n", @player.bank_roll)
		# elsif @high_low.player_wins == false
		# 	  @player.bank_roll = @player.bank_roll - @high_low.wager
		# 	  printf("Your new bank roll is $%.2f.\n", @player.bank_roll)
		# end
  #   	exit(0) if @player.bank_roll == 0
	 #    puts "Would you like to play again? (y/n)"
		# user_input = gets.strip.downcase
		# hit_the_tables if user_input == 'y'
  #   end

  # 	def payout_slots
		# if @slots.player_wins == true
		# 	@player.bank_roll = @player.bank_roll + @slots.wager
		# 	printf("Your new bank roll is $%.2f.\n", @player.bank_roll)
  #   	elsif @slots.player_wins == false
  #   		  @player.bank_roll = @player.bank_roll - @slots.wager 
  #   		  printf("Your new bank roll is $%.2f.\n", @player.bank_roll)
		# end
  #   	exit(0) if @player.bank_roll == 0
	 #    puts "Would you like to play again? (y/n)"
		# user_input = gets.strip.downcase
		# hit_the_tables if user_input == 'y'
  #   end

end


class Player
	attr_accessor :name, :bank_roll

	def initialize
		@name = name
		@bank_roll = bank_roll
		intro
	end

	def intro
		puts "Welcome to the casino. What's your name?"
		@name = gets.strip
		puts "How much is in your bank roll?"
		@bank_roll = gets.strip.to_f
		printf("Good luck %s, you have $%.2f to play with.\n", @name, @bank_roll)
	end
end


class Cashier
  	def self.payout_high_low(high_low, player)
		if high_low.player_wins == true 
			player.bank_roll = player.bank_roll + high_low.wager
			printf("Your new bank roll is $%.2f.\n", player.bank_roll)
		elsif high_low.player_wins == false
			player.bank_roll = player.bank_roll - high_low.wager
			printf("Your new bank roll is $%.2f.\n", player.bank_roll)
		end
    	exit(0) if player.bank_roll == 0
    end

  	def self.payout_slots(slots, player)
		if slots.player_wins == true
			player.bank_roll = player.bank_roll + slots.wager
			printf("Your new bank roll is $%.2f.\n", player.bank_roll)
    	elsif slots.player_wins == false
    		player.bank_roll = player.bank_roll - slots.wager 
    		printf("Your new bank roll is $%.2f.\n", player.bank_roll)
		end
    	exit(0) if player.bank_roll == 0
    end
end

Casino.new.hit_the_tables


# TO DO list
# dynamic wager (choose how much to bet, give option for all in)
