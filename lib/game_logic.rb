class Gamelogic
  @@pos_taken = [0,0]
  def initialize
    @@pos_taken = [0,0]
  end
  def replace_pos(array, pos, sym)
    array.length.times do |i|
      array.length.times do |j|
        if array[i][j] == pos
          array[i][j] = sym
          @@pos_taken.push(pos)
        end
      end
    end
  end

  def check_move(move = 0, array)
    @@pos_taken.length.times do |i|
      if @@pos_taken[i] == move
        return false
      end
    end
    if move < 1 || move > 9 || !(move.is_a? Integer)
      return false
    else
      return true
    end
  end
end
