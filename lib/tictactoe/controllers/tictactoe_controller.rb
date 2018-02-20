

require 'tictactoe/models/table_handler'
require 'tictactoe/models/computer_player'
require 'tictactoe/models/keyboard_player'


class TictactoeController

  attr_accessor :table_hdlr

  def initialize()

    @table_hdlr  = TableHandler.new(:player_one => KeyboardPlayer.new(:num_id => 2), :player_two =>ComputerPlayer.new(:num_id =>1) )

  end


  def check_win
    winner = @table_hdlr.check_win

    return winner
  end

  def player_one_turn 
    @table_hdlr.player_one_turn
  end

  def player_two_turn 
    @table_hdlr.player_two_turn
  end

  def reset_game
    @table_hdlr.reset_game
  end



end
