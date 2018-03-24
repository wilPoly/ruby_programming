class Board

    #protected
  def initialize(m, n)
    @m = m
    @n = n
    @board = Array.new(@m) { Array.new(@n) }
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

  # Checks the board status (full => a draw, already a mark there, empty => player can play here)
  def status(mark, player)
    empty?
    check_rows(mark, player)
    check_columns(mark, player)
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

  # reformat to allow different m,n,k variations
  # only works if k == m == n
  def check_rows(mark, player)
    @board.each do |i|
      if i.all? { |j| j == mark}
        player.win
      end
    end
  end

  # reformat to allow different m,n,k variations
  # only works if k == m == new<s
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