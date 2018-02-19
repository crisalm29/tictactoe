require 'tictactoe/models/abstract_player'

class TableHandler

	attr_accessor   :player_one, :player_two, :table

	def initialize(params = {})

		@player_one = params.fetch(:player_one, AbstractPlayer)
		@player_two = params.fetch(:player_two, AbstractPlayer)
		@table = params.fetch(:table,[[0,0,0],[0,0,0],[0,0,0]])

	end

	def reset_game

		@table = [[0,0,0],[0,0,0],[0,0,0]]

	end

	def player_one_turn

		@table = @player_one.play(self)

	end

	def player_two_turn

		@table = @player_two.play(self)

	end



	def available_spaces()

		counter = 0
		@table.each_with_index do |x, xi|
		  	x.each_with_index do |y, yi|
		  		if y==0
		  			counter+=1
		  		end
		  	end
		end

		return counter
	end

	def check_win()

		if available_spaces == 0
			return -1

	end

		for i in 0..2
			# verify columns
			if (@table[0][i] == @table[1][i] && @table[1][i] == @table[2][i]) && @table[1][i] != 0
				return @table[0][i]

			end

			#verify rows
			if (@table[i][0] == @table[i][1] && @table[i][1] == @table[i][2]) && @table[i][1] != 0

				return @table[i][0]

			end

		end

		#verify diagonal
		if check_diagonal_winner(@table)

			return @table[1][1]

		end


		# verify inverted diagonal
		if check_diagonal_winner(@table.reverse)
			return @table[1][1]
		end

		return 0

	end

	def check_diagonal_winner(tbl)


		if(tbl[0][0] == tbl[1][1] && tbl[1][1] == tbl[2][2]) && tbl[1][1] != 0

			return true

		end

		return false


	end


end