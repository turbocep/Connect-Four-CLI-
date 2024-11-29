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
    (1..@columns).each do |c| 
      char = valid_moves.include?(c) ? c : ' '
      print " #{char}"
    end
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
    (1..@columns).select do | index |
      @board[index - 1] == '_'
    end
  end

  def wins?
    # Return 1 for player 1, 2 for player 2, 0 for no wins.
    
  end
end



