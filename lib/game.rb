require_relative 'player'

class Game
  attr_reader :board, :players
  def initialize(columns = 7, rows = 6, players = [Player.new, Player.new])
    @columns = columns
    @rows = rows
    @board = Array.new(columns * rows, '_')
    @players = players
  end

  def render
    (1..@columns).each { |c| print " #{c}"}
    print " \n"
    @board.each_with_index do | element, i |
      if (i + 1) % @columns > 0
        print "|#{element}"
      else
        print "|#{element}|\n"
      end
    end
  end

  def add(column, symbol)
    current = column - 1
    loop do
      next_index = current + @columns
      if @board[next_index] != '_'
        return @board[current] = symbol
      else
        current += @columns
      end
    end
  end
end

# Create a verify-input method that ensures input is valid (row is not empty 
# or outside range). Can generate a list of valid commands and only accept 
# matching ones.

game = Game.new
game.render
game.add(1, 'X')
game.render
game.add(1, 'X')
game.render


