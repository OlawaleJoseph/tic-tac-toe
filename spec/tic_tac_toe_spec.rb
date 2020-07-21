require_relative '../lib/game_board'
require_relative '../lib/check_win'

describe 'Game Board' do
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

describe 'check_win' do
  let(:chkwin) { Checkwin.new }
  let(:array) { [[1, 2, 3], [4, 5, 6], [7, 8, 9]] }
  let(:right_diagonal) { [3, 5, 7] }
  let(:win_move1) { [%w[X X X], [4, 5, 6], [7, 8, 9]] }
  let(:win_move2) { [[1, 2, 3], %w[X X X], [7, 8, 9]] }
  let(:win_move3) { [[1, 2, 3], [4, 5, 6], %w[O O O]] }
  let(:win_move4) { [['O', 2, 3], ['O', 5, 6], ['O', 8, 9]] }
  let(:win_move5) { [[1, 'O', 3], [4, 'O', 6], [7, 'O', 9]] }
  let(:win_move6) { [[1, 2, 'O'], [4, 5, 'O'], [7, 8, 'O']] }
  let(:win_move7) { [['X', 2, 3], [4, 'X', 6], [7, 8, 'X']] }
  let(:win_move8) { [[1, 2, 'X'], [4, 'X', 6], ['X', 8, 9]] }
  let(:not_win) { [[1, 2, 'X'], [4, 'X', 6], ['O', 8, 9]] }
  describe 'get_right_diagonal' do
    it 'should return the right diagonal of the array' do
      expect(chkwin.get_right_diagonal(array)).to eql(right_diagonal)
    end
    it 'should return true if row one is win move' do
      expect(chkwin.wining_move(win_move1)).to be(true)
    end
    it 'should return true if row two is win move' do
      expect(chkwin.wining_move(win_move2)).to be(true)
    end
    it 'should return true if row three is win move' do
      expect(chkwin.wining_move(win_move3)).to be(true)
    end
    it 'should return true if column one is win move' do
      expect(chkwin.wining_move(win_move4)).to be(true)
    end
    it 'should return true if column two is win move' do
      expect(chkwin.wining_move(win_move5)).to be(true)
    end
    it 'should return true if column three is win move' do
      expect(chkwin.wining_move(win_move6)).to be(true)
    end
    it 'should return true if left diagonal is win move' do
      expect(chkwin.wining_move(win_move7)).to be(true)
    end
    it 'should return true if right diagonal is win move' do
      expect(chkwin.wining_move(win_move8)).to be(true)
    end
    it 'should return false there is no move' do
      expect(chkwin.wining_move(not_win)).to be(false)
    end
  end

  # describe 'check move' do
  #   it 'should return true for a valid position' do
  #     expect(board.check_move(2)).to be(true)
  #   end

  #   it 'should return false if no argument was passed' do
  #     expect(board.check_move).to be(false)
  #   end

  #   it 'should return false if the position is taken' do
  #     board.replace_pos(array, 2, 'O')
  #     expect(board.check_move(2)).to be(false)
  #   end

  #   it 'should return false if the position is out the range 1-9' do
  #     expect(board.check_move(20)).to be(false)
  #   end

  #   it 'should return false if the position is out the range 1-9' do
  #     expect(board.check_move('w')).to be(false)
  #   end
  # end
end
