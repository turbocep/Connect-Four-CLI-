require_relative 'player'

class Game
  attr_reader :board, :players
  def initialize(columns = 7, rows = 6, players = [Player.new, Player.new])
    @columns = columns
    @rows = rows
    @board = Array.new(columns * rows, ' ')
    @players = players
  end
end


