module Mechanics
	class Card
		attr_accessor :rank, :suit, :color
		# card = Card.new('10'), 'Spade', 'Black')
		def initialize(rank, suit, color)
			@rank = rank
			@suit = suit
			@color = color
		end
	end

	class Deck
		attr_accessor :cards, :ranks, :suits

		def initialize
			@ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
			@suits = %w(Spades Diamonds Clubs Hearts)
			@cards = []
			generate_deck
		end

		def self.ranks
			['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
		end

		def self.find_card(card)
			self.ranks.index(card.rank)
		end

		def generate_deck
			@suits.each do |suit|
				@ranks.size.times do |i|
					# Ternary Operator
					color = (i % 2 == 0) ? 'Black' : 'Red'
					@cards << Card.new(@ranks[i], suit, color)
				end
			end
		end

	end
end