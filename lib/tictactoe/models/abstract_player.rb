# abstract_player.rb 

class AbstractPlayer

  attr_accessor   :num_id

  def play(table)
    raise NotImplementedError
  end

end


