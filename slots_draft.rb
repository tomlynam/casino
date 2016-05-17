# require_relative 'mechanics/dice'
Dir[File.dirname(__FILE__) + '/mechanics/*.rb'].each {|file| require file }
require 'pry'

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
			# @player_wins = true
			# maybe also add a bonus here in addition to doubling the wager
		elsif numbers.uniq.count == 2
			puts "Winner winner!"
			# @player_wins = true
		else 
			puts "Sorry, not a winner."
			# @player_wins = false
		end
		
	end  
end

Slots.new.pull