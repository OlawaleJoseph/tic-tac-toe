require 'matrix'
class Gamelogic
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

  def get_right_diagonal(array)
    diag = []
    i = 0
    while i < 3 # rows
      j = 0
      while j < 3 # columns
        diag << array[i][j] if i + j == 2
        j += 1
      end
      i += 1
    end
    diag
  end

  # rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
  def wining_move(array)
    mat = Matrix[*array]
    chk = false
    right_diagonal = get_right_diagonal(array)
    left_diagonal = (0..array.length - 1).collect { |i| array[i][i] }
    3.times do |i|
      col = mat.column(i).to_a
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
  # rubocop:enable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
end
