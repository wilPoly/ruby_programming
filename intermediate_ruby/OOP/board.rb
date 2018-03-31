class Board

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
      puts i.join(" | ")
    end
  end

  def put_mark(position, mark)
    until @board.flatten.include?(position)
      puts "Which position do you want to mark?"
      print "> "
      position = $stdin.gets.chomp.to_i
      puts "\n"
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

  def status?(mark)
    win_condition = {
                    :diagonal_1 => [@board[0][0], @board[1][1], @board[2][2]],
                    :diagonal_2 => [@board[0][2], @board[1][1],@board[2][0]],
                    :row_1 => [@board[0][0], @board[0][1], @board[0][2]],
                    :row_2 => [@board[1][0], @board[1][1], @board[1][2]],
                    :row_3 => [@board[2][0], @board[2][1], @board[2][2]],
                    :column_1 => [@board[0][0], @board[1][0], @board[2][0]],
                    :column_2 => [@board[0][1], @board[1][1], @board[2][1]],
                    :column_3 => [@board[0][2], @board[1][2], @board[2][2]]
                     }
    win = false
    win_condition.each do |_, v|
      if v.all? { |i| i == mark }
        win = true
        break
      end
    end
    return win
  end

end




