class Player
  attr_reader :name, :type
  def initialize(name = 'anonymous', type = :user)
    @name = name
    @type = type
  end
end