

require 'tictactoe/models/abstract_player'
require 'stringio'
require 'tictactoe/models/game_exceptions'
require 'tictactoe/models/abstract_player'

class KeyboardPlayer < AbstractPlayer



	def initialize(params = {})
		@num_id = params.fetch(:num_id, 1)
	end

	def play(table_handler)


		played = false

		if table_handler.available_spaces == 0
			raise GameException, "Full table, can't play.\n"
		end

		while played == false
			column, row = get_position()
			if table_handler.table[column][row] == 0
				table_handler.table[column][row] = @num_id
				played = true
				return table_handler.table
			end
		end

		return table_handler.table
		

	end

	def get_position()

		invalid = true
		val = nil
		while invalid 
			puts "Enter a value between 1-9?\n"
			input = gets.chomp()
			#input =  STDIN.gets
			invalid = invalid_input(input)

		end
		val = Integer(input)
		column = ((val - 1)/3).to_i
		row = (val - 1)%3

		puts "column #{column} row #{row}"
		return column, row
	end

	def invalid_input(a)

		begin


			itg = Integer(a)

			if(itg < 1 || itg > 9)
				return true
			end
			return false
		rescue
			print "Enter a value between 1-9\n"
			return true
		end

	end
		


end