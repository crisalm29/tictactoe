require 'tictactoe'
require 'rspec'
require 'mocha/api'
require 'tictactoe/models/table_handler'
require 'tictactoe/models/computer_player'
require 'tictactoe/models/keyboard_player'

require 'matrix'

RSpec.describe TableHandler do 

	it "initializer: success call computer and keyboard players" do
		table = [[0,0,0],[0,0,0],[0,0,0]]
		game_table = TableHandler.new( :player_one => KeyboardPlayer.new, :player_two =>ComputerPlayer.new )


		expect( game_table.player_one ).to be_an_instance_of(KeyboardPlayer)
		expect( game_table.player_two ).to be_an_instance_of(ComputerPlayer)
		expect( game_table.table ).to match_array(table)

	end
	

	it "initializer: success call  keyboard players" do
		table = [[0,0,0],[0,0,0],[0,0,0]]
		game_table = TableHandler.new( :player_one => KeyboardPlayer.new, :player_two =>KeyboardPlayer.new )


		expect( game_table.player_one ).to be_an_instance_of(KeyboardPlayer)
		expect( game_table.player_two ).to be_an_instance_of(KeyboardPlayer)
		expect( game_table.table ).to match_array(table)

	end
	

	it "initializer: success call computer players" do
		table = [[0,0,0],[0,0,0],[0,0,0]]
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new )


		expect( game_table.player_one ).to be_an_instance_of(ComputerPlayer)
		expect( game_table.player_two ).to be_an_instance_of(ComputerPlayer)
		expect( game_table.table ).to match_array(table)

	end


end