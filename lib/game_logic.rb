require 'matrix'
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

  def get_right_diagonal(array)
    diag = []           
    i = 0
    while i < 3 #rows
      j = 0
      while j < 3 #columns
        if i+j == 2
          diag << array[i][j]
        end
        j+=1
      end
      i+=1
    end
    diag
  end
  def wining_move(array)
      mat = Matrix[*array]
      chk = false
      right_diagonal = get_right_diagonal(array)
      left_diagonal = (0..array.length-1).collect { |i| array[i][i] }
      3.times do |i|
        col =  mat.column(i).to_a
        ro = mat.row(i).to_a
       if col.all?('X') || col.all?('O')
        chk = true
        return chk
       elsif ro.all?('X') || ro.all?('O')
        chk = true
       elsif right_diagonal.all?('X') || right_diagonal.all?('O')
        chk = true
       elsif left_diagonal.all?('O') || left_diagonal.all?('X')
        chk = true
       end
      end
      chk
    end
end
