class Gamelogic
  def replace_pos(array, pos, sym)
    array.length.times do |i|
      array.length.times do |j|
        array[i][j] = sym if array[i][j] == pos
      end
    end
  end

  def check_move(move = 0, array)
    array.length.times do |i|
        array.length.times do |j|
            if array[i][j] == 'O' || array[i][j] == 'X'
                false 
            end       
        end
    end
    if move < 1 || move > 9 || !(move.is_a? Integer)
      return false
    else
      return true
    end
  end
end
