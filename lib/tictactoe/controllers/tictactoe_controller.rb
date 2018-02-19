

require 'tictactoe/models/table_handler'
require 'tictactoe/models/computer_player'
require 'tictactoe/models/keyboard_player'


class TictactoeController

	attr_accessor :table_hdlr

	def initialize()

		@table_hdlr  = TableHandler.new(:player_one => KeyboardPlayer.new(2), :player_two =>ComputerPlayer.new(1) )

	end


	def who_start()

	end

	def play_game()

		while @table_hdlr.check_win

			
			
		end
		
	end



end
