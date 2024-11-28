require_relative '../lib/player'

describe Player do
  describe '#initialize' do
    context 'default player is created' do
      it 'creates player with anon name' do
        player = Player.new
        expect(player.name).to eql ('anonymous')
      end
      it 'creates player with type user' do
        player = Player.new
        expect(player.type).to be :user
      end
    end
    context 'custom player is created' do
      it 'creates player with custom name' do
        name = 'Player 1'
        player = Player.new(name)
        expect(player.name).to eql(name)
      end
      it 'creates player with bot type' do
        name = 'Bot 1'
        player = Player.new(name, :bot)
        expect(player.type).to be :bot
      end
    end
  end
end