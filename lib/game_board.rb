class Gameboard
  @pos_taken = [0, 0]
  def initialize
    @pos_taken = [0, 0]
  end

  def replace_pos(array, pos, sym)
    array.length.times do |i|
      array.length.times do |j|
        if array[i][j] == pos
          array[i][j] = sym
          @pos_taken.push(pos)
        end
      end
    end
  end

  def check_move(move = 0)
    @pos_taken.length.times do |i|
      return false if @pos_taken[i] == move
    end
    if move < 1 || move > 9 || !(move.is_a? Integer)
      false
    else
      true
    end
  end
end
