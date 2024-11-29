require_relative 'player'

class Game
  attr_reader :board, :players, :rows
  def initialize(columns = 7, rows = 6, players = [Player.new('X'), Player.new('O')])
    @columns = columns
    @rows = rows
    @board = Array.new(columns * rows, '_')
    @players = players
    @round = 1
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

  def horizontals
    result = []
    @rows.times do | row |
      start = row * @columns
      stop = start + @columns - 1
      result.push(@board[start..stop])
    end
    result
  end

  def verticals
    (0..(@columns - 1)).map do | column |
      result = []
      current = column
      loop do
        result.push(@board[current])
        current += @columns
        break result if current > (@board.length - 1)
      end
    end
  end

  def diagonals_left
    index = 0
    result = []
    loop do
      current = index
      resultant_diagonal = []
      loop do
        resultant_diagonal.push(@board[current])
        break result.push(resultant_diagonal) if current % @columns == 0 || current / @columns >= @rows - 1

        current += (@columns - 1)
      end 
      index += (index + 1) >= @columns ? @columns : 1
      return result if index > @board.length
    end
  end

  def diagonals_right
    index = @columns - 1
    result = []
    loop do
      current = index
      resultant_diagonal = []
      loop do
        resultant_diagonal.push(@board[current])
        break result.push(resultant_diagonal) if (current + 1) % @columns == 0 || current / @columns >= @rows - 1

        current += (@columns + 1)
      end
      increment = index == 0 || index > (@columns - 1) ? @columns : -1
      index += increment
      return result if index >= @board.length
    end
  end

  def diagonals
    diagonals_left.concat(diagonals_right)
  end

  def win?
    horizontals.concat(verticals, diagonals).map do |combo|
      new_combo = combo
      new_combo.delete('_')
      new_combo.length >= 4 ? new_combo : nil
    end.compact.each do | combo |
      current = combo.first
      count = 0
      combo.each do | char |
        if char == current
          count += 1
        else
          count = 1
          current = char
        end
        return true if count == 4
      end
    end
    false
  end

  def play
    # Welcome messages
    # First player goes
    # Loop and all that shit
    # End game
    puts "Welcome to Connect Four players #{@players.first.name} and #{@players.last.name}!"
    loop do
      puts "Round #{@round}"
      render
      current_player = @round.odd? ? @players.first : @players.last
      move = current_player.get_move(valid_moves)
      add(move, current_player.symbol)
      @round += 1
      if @round > 4
        if win?
          puts "GAME OVER"
          puts "#{current_player.name} with symbol #{current_player.symbol} WON in #{@round} rounds!"
          break
        elsif valid_moves == []
          puts "GAME OVER"
          puts "It was a tie!"
        end
      end
    end
  end
end

Game.new.play





