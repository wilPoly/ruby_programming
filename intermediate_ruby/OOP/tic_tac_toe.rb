class GameInterface

  @@player_count = 0
  @@player_max = 2

  attr_accessor :players

  def initialize(game_name)
    @players = {}
    puts "Welcome to WilPoly's #{game_name}"
    # puts "How many players ?"
    # number_of_players = gets.chomp.to_i  #check against player_max
    #raise error if @number_of_players is not 1 or 2
    player_number = 1
    while player_number <= @@player_max #number_of_players 
      create_player(player_number)
      player_number += 1
      @@player_count += 1
      puts "\n"
    end
    # puts @@player_count
    # @players.each { |k, v| puts "#{k} => #{v}" }
    # p @players
    # p @players
    #game_turn
    @players.each { |k, v| puts "Player #{k}'s name is #{v.name}"} #checking if I can access data inside the hash => sucessful
  end

  # def number_of_players(number)
  #   until @@player_count == @@player_max
  #     @number_of_players += 1
  #   end
  # end

  def create_player(player_number)
    puts "What is your name ?"
    player_name = gets.chomp
    @players[player_number] = Player.new(player_name)
  end

  def create_board
    @board = Board.new(m, n)
  end

  def game_turn
  end

end

class Board

  attr_reader :board_status
  
  def initialize(m, n)
    @board = Array.new(m) { Array.new(n) {0} }
    #iteration pour affichage en colonnes...
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

class Player

  attr_accessor :name, :score

  def initialize(name, score=0)
    @name = name
    @score = score
  end

  def put_mark(location)

  end

  def win
    @score += 1
  end

end

class Mark
  attr_accessor :type, :player, :position

  def initialize(type, player, position)
    @type = type
    @player = player
    @position = position
  end
  
  # if player1 => type = "X"
  # if player2 => type = "O"
end

#game = GameInterface.new("Tic-tac-toe")
board = Board.new(3, 3)
board.draw_board