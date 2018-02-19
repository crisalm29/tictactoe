require 'tictactoe'
require 'rspec'
require 'mocha/api'
require 'tictactoe/models/computer_player'
require 'tictactoe/models/table_handler'

require 'matrix'

RSpec.describe ComputerPlayer do 

	it "play: turn with empty table" do
		table = [[0,0,0],[0,0,0],[0,0,0]]
		expected_table = [[0,0,0],[0,2,0],[0,0,0]]
		player = ComputerPlayer.new
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new(:num_id => 1), :table => table )
		

		player.stubs(:calculate_random_position).returns([1,1])

		expect( player.play(game_table) ).to match_array(expected_table)

	end

	it "play: turn with non empty table" do
		table = [[1,0,0],[0,0,2],[1,2,1]]
		expected_table = [[1, 0, 0], [2, 0, 2], [1, 2, 1]]
		player = ComputerPlayer.new
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new(:num_id => 1), :table => table )


		player.stubs(:calculate_random_position).returns([1,0])
		
		expect(  player.play(game_table) ).to match_array(expected_table)

	end


	it "calculate_random_position: expect 0,0" do
		table = [[1,0,0],[0,0,2],[1,2,1]]
		expected_table = [0,0]
		player = ComputerPlayer.new

		Random.stubs(:rand).returns(0)
		
		expect( player.calculate_random_position ).to match_array(expected_table)

	end


	it "calculate_random_position: expect 1,0" do
		table = [[1,0,0],[0,0,2],[1,2,1]]
		expected_table = [1,0]
		player = ComputerPlayer.new

		Random.stubs(:rand).returns(1)
		
		expect( player.calculate_random_position ).to match_array(expected_table)

	end




	it "calculate_random_position: expect 2,0" do
		table = [[1,0,0],[0,0,2],[1,2,1]]
		expected_table = [2,0]
		player = ComputerPlayer.new

		Random.stubs(:rand).returns(2)
		
		expect( player.calculate_random_position ).to match_array(expected_table)

	end



	it "calculate_random_position: expect 0,1" do
		table = [[1,0,0],[0,0,2],[1,2,1]]
		expected_table = [0,1]
		player = ComputerPlayer.new

		Random.stubs(:rand).returns(3)
		
		expect( player.calculate_random_position ).to match_array(expected_table)

	end



	it "calculate_random_position: expect 1,1" do
		table = [[1,0,0],[0,0,2],[1,2,1]]
		expected_table = [1,1]
		player = ComputerPlayer.new

		Random.stubs(:rand).returns(4)
		
		expect( player.calculate_random_position ).to match_array(expected_table)

	end



	it "calculate_random_position: expect 2,1" do
		table = [[1,0,0],[0,0,2],[1,2,1]]
		expected_table = [2,1]
		player = ComputerPlayer.new

		Random.stubs(:rand).returns(5)
		
		expect( player.calculate_random_position ).to match_array(expected_table)

	end



	it "calculate_random_position: expect 2,0" do
		table = [[1,0,0],[0,0,2],[1,2,1]]
		expected_table = [2,0]
		player = ComputerPlayer.new

		Random.stubs(:rand).returns(6)
		
		expect( player.calculate_random_position ).to match_array(expected_table)

	end



	it "calculate_random_position: expect 2,1" do
		table = [[1,0,0],[0,0,2],[1,2,1]]
		expected_table = [2,1]
		player = ComputerPlayer.new

		Random.stubs(:rand).returns(7)
		
		expect( player.calculate_random_position ).to match_array(expected_table)

	end


	it "calculate_random_position: expect 2,2" do
		table = [[1,0,0],[0,0,2],[1,2,1]]
		expected_table = [2,2]
		player = ComputerPlayer.new

		Random.stubs(:rand).returns(8)
		
		expect( player.calculate_random_position ).to match_array(expected_table)

	end


end