require 'tictactoe'
require 'rspec'
require 'mocha/api'
require 'tictactoe/models/computer_player'

require 'matrix'

RSpec.describe ComputerPlayer do 

	it "Turn with empty table" do
		table = [[0,0,0],[0,0,0],[0,0,0]]
		expected_table = [[0,0,0],[0,2,0],[0,0,0]]
		player = ComputerPlayer.new

		rnd = Random.new

		player.stubs(:calculate_random_position).returns([1,1])

		expect( player.play(table) ).to match_array(expected_table)

	end

	it "Turn with non empty table" do
		table = [[1,0,0],[0,0,2],[1,2,1]]
		expected_table = [[1,1,0],[0,0,2],[1,2,1]]
		player = ComputerPlayer.new

		rnd = Random.new

		player.stubs(:calculate_random_position).returns([1,0])

		expect( player.play(table) ).to match_array(expected_table)

	end

end