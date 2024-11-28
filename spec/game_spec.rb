require_relative '../lib/game'

describe Game do
  describe '#initialize' do
    context 'when no board is specified' do
      it 'creates 42-length array to @board' do
        board = Game.new.board
        expect(board).to eql(Array.new(42, ' '))
      end
    end
    context 'when 4 x 4 board is specified' do
      it 'creates 16-length array to @board' do
        board = Game.new(4, 4).board
        expect(board).to eql(Array.new(16, ' '))
      end
    end
  end
end