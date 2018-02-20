class Board

    #protected
  def initialize(m, n)
    @m = m
    @n = n
    @board = Array.new(@m) { Array.new(@n) {0} }
  end
  
  def draw_board
    @board.each do |i|
      puts i.join("|")
    end
  end

  def board_position
   # @board_status = {board_position :x, etc}
  end

  def check_rows
  end

  def check_columns(mark)
    win_count = 0
    b.each_index do |i|
      b[i].each_index do |j|
        if (b[i][i] == b[j][i]) == mark
          win_count += 1
        else
          win_count = 0
        end
        #check for equality 3 times in a row
      end
    end
  end

end

# board = Board.new(3, 3)
# board.draw_board