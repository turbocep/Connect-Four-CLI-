require_relative '../lib/game'

describe Game do
  describe '#initialize' do
    context 'when no board is specified' do
      it 'creates 42-length array to @board' do
        board = Game.new.board
        expect(board).to eql(Array.new(42, '_'))
      end
    end
    context 'when 4 x 4 board is specified' do
      it 'creates 16-length array to @board' do
        board = Game.new(4, 4).board
        expect(board).to eql(Array.new(16, '_'))
      end
    end
  end
  describe '#add' do
    context 'when board is empty' do
      context 'when piece is added to column 1' do
        it 'gets added to bottom' do
          board = Game.new
          board.add(1, 'X')
          expect(board.board[35]).to eql 'X'
        end
      end
      context 'when piece is added to column 7' do
        it 'gets added to bottom' do
          board = Game.new
          board.add(7, 'X')
          expect(board.board[41]).to eql('X')
        end
        it 'increases number of pieces by 1' do
          board = Game.new
          expect {board.add(7, 'X')}.to change{board.board.count('X')}.from(0).to(1)
        end
        it 'decreases number of empty elements by 1' do
          board = Game.new
          expect {board.add(7, 'X')}.to change {board.board.count('_')}.from(42).to(41)
        end
      end
    end
    context 'when symbol is added in non-empty column' do
      it 'gets added on top' do
        board = Game.new
        board.add(3, 'X')
        board.add(3, 'O')
        expect(board.board[30]).to eql('O')
      end
    end
  end
end