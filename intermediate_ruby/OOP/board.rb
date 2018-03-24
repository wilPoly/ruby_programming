class Board

    #protected
  def initialize
    @board = Array.new(3) { Array.new(3) }
    position_index = 1
    # Fills the array with position numbers
    @board.each_with_index do |row, i|
      row.each_index do |j| 
        @board[i][j] = position_index
        position_index += 1
      end
    end
  end
  
  def draw_board
    @board.each do |i|
      puts i.join("|")
    end
  end

  def put_mark(position, mark)
    until @board.flatten.include?(position)
      puts "Which position do you want to mark?"
      print "> "
      position = $stdin.gets.chomp.to_i
      unless @board.flatten.include?(position)
        puts "You can't play here!"
        redo
      end
    end
    @board.each_with_index do |row, i|
      row.each_index do |j|
        @board[i][j] = mark if @board[i][j] == position
      end
    end
  end

  # Checks the board status (full => a draw, already a mark there, empty => player can play here)
  def status(mark, player)
    
  end

  

  # def check_rows(mark, player)
  #   @board.each do |i|
  #     if i.all? { |j| j == mark}
  #       player.win
  #     end
  #   end
  # end

  # def check_columns(mark, player)
  #   @board.each_index do |i|
  #     @board[i].each_index do |j|
  #       if (@board[i][i] == @board[j][i]) == mark
  #         player.win
  #       end
  #     end
  #   end
  # end

end

# board = Board.new(3, 3)
# board.draw_board