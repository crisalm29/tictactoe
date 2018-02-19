

require 'tictactoe/controllers/tictactoe_controller'


class GamePrinter

	attr_accessor :game_ctrl

	def initialize()

		@game_ctrl  = TictactoeController.new

	end


	def print_table()

		table = @game_ctrl.table_hdlr.table

		print "******** TIC TAC TOE ********\n\n"

		table.each_with_index do |x, xi|

			if xi == 1 || xi == 2
				print "---+---+---\n"
			end
			x.each_with_index do |y, yi|

				if yi == 1 || yi == 2
					print " |"
				end
				print " #{table[xi][yi]}"

		  	end

		  	print "\n"
		end

	end
	
	def who_start()

		Random.srand
		spaces_moved = Random.rand(2)
	end

	def play_game()
		result = 0
		player = who_start
		if player == 0
			print "You go first!!\n\n"
		end
		if player == 1
			print "Computer will go first!\n\n"
		end
		
		while result == 0
			print_table
			result =  @game_ctrl.check_win
			if result != 0
				break
			end
			if player == 0
				@game_ctrl.player_one_turn
				player = 1
			end
			if player == 1
				@game_ctrl.player_two_turn
				player = 0
			end

		end
		
	end



end