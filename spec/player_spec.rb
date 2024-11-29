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
  describe '#valid_move?' do
    let(:player) {Player.new}
    context 'when valid move' do
      it 'returns true' do
        valid_moves = [1, 2, 3, 4, 5, 6, 7]
        move = 4
        expect(player.valid_move?(move, valid_moves)).to be true
      end
      it 'returns true' do
        valid_moves = [1, 2, 3, 4, 5, 6, 7]
        move = 1
        expect(player.valid_move?(move, valid_moves)).to be true
      end
      it 'returns true' do
        valid_moves = [1, 2, 3, 4, 5, 6, 7]
        move = 7
        expect(player.valid_move?(move, valid_moves)).to be true
      end
      it 'returns true' do
        valid_moves = [6]
        move = 6
        expect(player.valid_move?(move, valid_moves)).to be true
      end
    end
    context 'when invalid move' do
      it 'returns false' do
        valid_moves = [1, 2, 3, 4, 5, 6, 7]
        move = 8
        expect(player.valid_move?(move, valid_moves)).to be false
      end
      it 'returns false' do
        valid_moves = [1, 2, 3, 4, 5, 6, 7]
        move = 0
        expect(player.valid_move?(move, valid_moves)).to be false
      end
      it 'returns false' do
        valid_moves = [1, 2, 3, 4, 5, 6, 7]
        move = -3
        expect(player.valid_move?(move, valid_moves)).to be false
      end
      it 'returns false' do
        valid_moves = [4, 5, 6, 7]
        move = 3
        expect(player.valid_move?(move, valid_moves)).to be false
      end
      it 'returns false' do
        valid_moves = []
        move = 6
        expect(player.valid_move?(move, valid_moves)).to be false
      end
    end
  end
end