class Player
  attr_reader :name, :type
  def initialize(name = 'anonymous', type = :user)
    @name = name
    @type = type
  end

  def get_move(valid_moves)
    #TODO(Turbo): Expand options for Player type.
    case type
    when :user then user_input(valid_moves)
    end
  end

  # User Input method: I could probably do this with Lambdas.
  def user_input(valid_moves)
    loop do
      puts "#{name}, enter your move:"
      move = gets.chomp.to_i
      return move if valid_move?(move, valid_moves)
      puts "Invalid input #{name}, try again."
    end
  end

  def valid_move?(move, valid_moves)
    valid_moves.include?(move)
  end
end

player = Player.new
p player.get_move([1])