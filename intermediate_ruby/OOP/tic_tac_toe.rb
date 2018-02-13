class Interface

  @@player_count = 0

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
    @@player_count += 1
  end

  def draw_board
  end

end

class Board

  attr_reader :board_status

end

class Player


  def initialize(name, score=0)
    @name = name
    @score = score
  end

  def put_mark(location)
  end

end

class Mark < Board

  def board_position
  end

end

