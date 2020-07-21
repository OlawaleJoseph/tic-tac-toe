require_relative '../lib/game_board'

describe "Game Board" do
  let(:board) { Gameboard.new }
  let(:array) { [[1, 2, 3], [4, 5, 6], [7, 8, 9]] }

  describe 'replace position' do
    it 'should change the element to the symbol in the provided position' do
      sym = 'X'
      board.replace_pos(array, 1, sym)
      expect(array[0][0]).to eq(sym)
    end
  end

  describe 'check move' do
    it 'should return true for a valid position' do
      expect(board.check_move(2)).to be(true)
    end

    it 'should return false if no argument was passed' do
      expect(board.check_move).to be(false)
    end

    it 'should return false if the position is taken' do
      board.replace_pos(array, 2, 'O')
      expect(board.check_move(2)).to be(false)
    end

    it 'should return false if the position is out the range 1-9' do
      expect(board.check_move(20)).to be(false)
    end

    it 'should return false if the position is out the range 1-9' do
      expect(board.check_move('w')).to be(false)
    end
  end
end
