

require 'tictactoe'
require 'rspec'
require 'mocha/api'
require 'tictactoe/models/keyboard_player'
require 'tictactoe/models/table_handler'



RSpec.describe KeyboardPlayer do 



	it "play: turn with empty table" do
		table = [[0,0,0],[0,0,0],[0,0,0]]
		expected_table = [[0,0,0],[0,1,0],[0,0,0]]
		player = KeyboardPlayer.new
		game_table = TableHandler.new( :player_one => KeyboardPlayer.new, :player_two =>KeyboardPlayer.new(:num_id => 1), :table => table )
		

		player.stubs(:get_position).returns([1,1])

		expect( player.play(game_table) ).to match_array(expected_table)

	end

	it "play: turn with non empty table" do
		table = [[1,0,0],[0,0,2],[1,2,1]]
		expected_table = [[1, 0, 0], [1, 0, 2], [1, 2, 1]]
		player = KeyboardPlayer.new
		game_table = TableHandler.new( :player_one => KeyboardPlayer.new, :player_two =>KeyboardPlayer.new(:num_id => 1), :table => table )


		player.stubs(:get_position).returns([1,0])
		
		expect(  player.play(game_table) ).to match_array(expected_table)

	end



end