#computer_player.rb

require 'tictactoe/models/abstract_player'

require 'matrix'
require 'tictactoe/models/game_exceptions'
require 'tictactoe/models/abstract_player'

class ComputerPlayer < AbstractPlayer

	def play(table)

		played = false

		if available_spaces(table) == 0
			raise GameException, "Full table, can't play."
		end


		while played == false
			column, row = calculate_random_position()
			if table[column][row] == 0
				table[column][row] = 2
				played = true
				return table
			end
		end

		return table

	end

	def calculate_random_position()

		Random.srand
		spaces_moved = Random.rand(9)
		column = (spaces_moved/3).to_i
		row = spaces_moved%3
		return column, row
	end

	def available_spaces(table)

		counter = 0
		table.each_with_index do |x, xi|
		  	x.each_with_index do |y, yi|
		  		if y==0
		  			counter+=1
		  		end
		  	end
		end

	end


end

