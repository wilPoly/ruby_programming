require './player'

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

  # Checks the board status (full => a draw, etc)
  def status(mark, player)
    empty?
    check_rows(mark, player)
    check_columns(mark, player)
  end

  def position(position, mark)
  end

  def check_rows(mark, player)

    @board.each do |i|
      if i.all? { |j| j == mark}
        player.win
      end
    end
  end

  def check_columns(mark, player)

    @board.each_index do |i|
      @board[i].each_index do |j|
        if (@board[i][i] == @board[j][i]) == mark
          player.win
        end
      end
    end
  end

end

# board = Board.new(3, 3)
# board.draw_board