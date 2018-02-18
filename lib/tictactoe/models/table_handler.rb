require 'tictactoe/models/abstract_player'

class TableHandler

	attr_accessor   :player_one, :player_two, :table

	def initialize(params = {})

		@player_one = params.fetch(:player_one, AbstractPlayer)
		@player_two = params.fetch(:player_two, AbstractPlayer)
		@table = [[0,0,0],[0,0,0],[0,0,0]]

	end

	def reset_game

		@table = [[0,0,0][0,0,0][0,0,0]]

	end

	def player_one_turn

		@table = @player_one.play(@table)

	end

	def player_two_turn

		@table = @player_two.play(@table)

	end



end