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
    let(:game) { described_class.new }
    context 'when board is empty' do
      context 'when piece is added to column 1' do
        it 'gets added to bottom' do
          game.add(1, 'X')
          expect(game.board[35]).to eql 'X'
        end
      end
      context 'when piece is added to column 7' do
        it 'gets added to bottom' do
          game.add(7, 'X')
          expect(game.board[41]).to eql('X')
        end
        it 'increases number of pieces by 1' do
          expect {game.add(7, 'X')}.to change{game.board.count('X')}.from(0).to(1)
        end
        it 'decreases number of empty elements by 1' do
          expect {game.add(7, 'X')}.to change {game.board.count('_')}.from(42).to(41)
        end
      end
    end
    context 'when symbol is added in non-empty column' do
      it 'gets added on top' do
        game.add(3, 'X')
        game.add(3, 'O')
        expect(game.board[30]).to eql('O')
      end
    end
  end
  describe '#valid_moves' do
    let(:game) { Game.new }
    context 'when board is empty' do
      it 'returns array of valid moves' do
        result = game.valid_moves
        expect(result).to eql([1, 2, 3, 4, 5, 6, 7])
      end
    end
    context 'when column 1 is full' do
      it 'returns array of valid moves' do
        game.rows.times { game.add(1, 'X') }
        result = game.valid_moves
        expect(result).to eql([2, 3, 4, 5, 6, 7])
      end
    end
    context 'when only last column is empty' do
      it 'returns array containing only 7' do
        (1..6).each do | column |
          6.times { game.add(column, 'X') }
        end
        result = game.valid_moves
        expect(result).to eql([7])
      end
    end
    context 'when each column almost full' do
      it 'returns array of valid moves' do
        (1..7).each do |column|
          5.times { game.add(column, 'X') }
        end
        result = game.valid_moves
        expect(result).to eql([1, 2, 3, 4, 5, 6, 7])
      end
    end
    context 'when entire board is full' do
      it 'returns empty array' do
        (1..7).each { |column| 6.times {game.add(column, 'X')}}
        result = game.valid_moves
        expect(result).to eql([])
      end
    end
  end
end