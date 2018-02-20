require 'rspec'
require 'tictactoe/models/abstract_player'


RSpec.describe AbstractPlayer do 

  it "play: expect not implemented error" do
    expect { AbstractPlayer.new.play(nil) }.to raise_error(NotImplementedError)
  end
  

end