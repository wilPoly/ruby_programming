class Board

  attr_reader :board_status
  
  def initialize
    puts "Welcome to WilPoly's tic-tac-toe"
      create_player(player_1)
      create_player(player_2)
    draw_board
    puts "Your move #{player_1}"
  end

  def create_player(player_number)
    puts "What is your name ?"
    player_name = gets.chomp
    Player.new(player_name)
  end

  def draw_board(m, n)
    # @board_grid = (1..(m * n)).to_a
    @board_grid = Array.new(m) { Array.new(n) { " | "} }
    #iteration pour affichage en colonnes...
  end
  
  def board_position
   # @board_status = {board_position :x, etc}
  end

end

class Player < Board
  attr_reader :name, :score

  def initialize(name, score=0)
    @name = name
    @score = score
  end

  def put_mark(location)
  end

end

class Mark < Board
  attr_accessor :type, :player, :position
  
  # if player1 => type = "X"
  # if player2 => type = "O"
end

