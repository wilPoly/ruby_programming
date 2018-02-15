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

end

# board = Board.new(3, 3)
# board.draw_board