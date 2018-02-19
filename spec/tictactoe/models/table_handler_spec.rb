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
	

	it "reset_game: reset table game" do
		table = [[0,0,0],[0,0,0],[0,0,0]]
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new )

		Random.stubs(:rand).returns(0)
		game_table.player_one_turn

		expect( game_table.table ).to match_array([[2,0,0],[0,0,0],[0,0,0]])

		game_table.reset_game

		expect( game_table.table ).to match_array([[0,0,0],[0,0,0],[0,0,0]])

	end


	it "player_one_turn: play a turn" do
		table = [[0,0,0],[0,0,0],[0,0,0]]
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new )

		Random.stubs(:rand).returns(0)
		game_table.player_one_turn

		expect( game_table.table ).to match_array([[2,0,0],[0,0,0],[0,0,0]])


	end



	it "player_one_turn: play a turn" do
		table = [[0,0,0],[0,0,0],[0,0,0]]
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new(:num_id => 1) )

		Random.stubs(:rand).returns(0)
		game_table.player_two_turn

		expect( game_table.table ).to match_array([[1,0,0],[0,0,0],[0,0,0]])


	end


	it "available_spaces: all available spaces" do
		table = [[0,0,0],[0,0,0],[0,0,0]]
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new(:num_id => 1), :table => table )

		expect( game_table.available_spaces() ).to eq(9)

	end


	it "available_spaces: none available spaces" do
		table = [[1,2,1],[1,1,2],[2,1,2]]
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new(:num_id => 1), :table => table )

		
		expect( game_table.available_spaces() ).to eq(0)

	end



	it "available_spaces: five available spaces" do
		table = [[1,0,1],[0,0,2],[0,1,0]]
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new(:num_id => 1), :table => table )

		
		expect( game_table.available_spaces() ).to eq(5)

	end

	it "check_diagonal_winner: with winner" do
		table = [[1,0,0],[0,1,0],[0,0,1]]
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new(:num_id => 1) )

		expect( game_table.check_diagonal_winner(table) ).to eq(true)

	end


	it "check_diagonal_winner: with no winner" do
		table = [[1,0,0],[0,0,0],[0,0,1]]
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new(:num_id => 1) )

		expect( game_table.check_diagonal_winner(table) ).to eq(false)

	end


	it "check_win: diagonal winner" do
		table = [[1,0,0],[0,1,0],[0,0,1]]
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new(:num_id => 1), :table => table )

		
		expect( game_table.check_win ).to eq(1)

	end


	it "check_win: inverted diagonal winner" do
		table = [[0,0,1],[0,1,0],[1,0,0]]
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new(:num_id => 1), :table => table )

		
		expect( game_table.check_win ).to eq(1)

	end



	it "check_win: vertical winner player 1" do
		table = [[1,0,0],[1,0,0],[1,0,0]]
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new(:num_id => 1), :table => table )

		
		expect( game_table.check_win ).to eq(1)

	end


	it "check_win: vertical winner player 2" do
		table = [[2,0,0],[2,0,0],[2,0,0]]
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new(:num_id => 1), :table => table )

		
		expect( game_table.check_win ).to eq(2)

	end

	it "check_win: another vertical winner player 1" do
		table = [[0,1,0],[0,1,0],[0,1,0]]
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new(:num_id => 1), :table => table )

		
		expect( game_table.check_win ).to eq(1)

	end



	it "check_win: another vertical winner player 2" do
		table = [[0,2,0],[0,2,0],[0,2,0]]
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new(:num_id => 1), :table => table )

		
		expect( game_table.check_win ).to eq(2)

	end


	it "check_win:  horizontal winner player 1" do
		table = [[1,1,1],[0,2,0],[0,2,0]]
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new(:num_id => 1), :table => table )

		
		expect( game_table.check_win ).to eq(1)

	end



	it "check_win: another horizontal winner player 1" do
		table = [[0,0,0],[0,2,0],[1,1,1]]
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new(:num_id => 1), :table => table )

		
		expect( game_table.check_win ).to eq(1)

	end



	it "check_win:  horizontal winner player 2" do
		table = [[2,2,2],[0,2,0],[0,2,0]]
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new(:num_id => 1), :table => table )

		
		expect( game_table.check_win ).to eq(2)

	end

	



	it "check_win: another horizontal winner player 2" do
		table = [[0,2,0],[2,2,2],[0,2,0]]
		game_table = TableHandler.new( :player_one => ComputerPlayer.new, :player_two =>ComputerPlayer.new(:num_id => 1), :table => table )

		
		expect( game_table.check_win ).to eq(2)

	end



end