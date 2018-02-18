

class GameException < StandardError
	def initialize(msg="There was an error during the game")
    super
  end
end