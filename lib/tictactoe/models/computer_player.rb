#computer_player.rb



require 'matrix'
require 'tictactoe/models/game_exceptions'
require 'tictactoe/models/abstract_player'
require 'tictactoe/models/table_handler'

class ComputerPlayer < AbstractPlayer


  def initialize(params = {})

    @num_id = params.fetch(:num_id, 2)

  end

  def play(table_handler)



    played = false

    if table_handler.available_spaces == 0
      raise GameException, "Full table, can't play.\n"
    end

    while played == false
      column, row = calculate_random_position()
      if table_handler.table[column][row] == 0
        table_handler.table[column][row] = @num_id
        played = true
        return table_handler.table
      end
    end

    table_handler.table

  end

  def calculate_random_position()

    Random.srand
    spaces_moved = Random.rand(9)
    column = (spaces_moved/3).to_i
    row = spaces_moved%3
    [column, row]
  end

  def available_spaces(table)

    counter = 0
    table.each_with_index do |x, xi|
        x.each_with_index do |y, yi|
          if y==0
            counter+=1
          end
        end
    end

    counter
  end



end

