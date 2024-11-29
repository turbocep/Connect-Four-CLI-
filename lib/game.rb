require_relative 'player'

class Game
  attr_reader :board, :players, :rows
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

  def valid_moves
    # Returns an array of columns in which a move can be made.
    (1..@columns).select do | index |
      @board[index - 1] == '_'
    end
    
  end
end

# Create a verify-input method that ensures input is valid (row is not empty 
# or outside range). Can generate a list of valid commands and only accept 
# matching ones.

# Player class prompts user for input (or Bot). It takes available_moves as a 
# parameter and only accepts valid moves. 



