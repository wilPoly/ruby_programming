## => Tic-Tac-Toe
## => https://en.wikipedia.org/wiki/Tic-tac-toe
## => https://en.wikipedia.org/wiki/M,n,k-game

require './board'
require './player'

class GameInterface

  @@player_count = 0
  @@player_max = 2
  @@m = 3 #number of rows
  @@n = 3 #number of columns
  @@k = 3 #number of marks aligned to win

  attr_accessor :players

  def initialize(game_name)
    puts "Welcome to WilPoly's #{game_name}"
    # puts "How many players ?"
    # number_of_players = gets.chomp.to_i  #check against player_max
    #raise error if @number_of_players is not 1 or 2
    ### Create players
    @players = {}
    player_number = 1
    while player_number <= @@player_max #number_of_players 
      create_player(player_number)
      player_number += 1
      @@player_count += 1
      puts "\n"
    end
    ###Create Board
    create_board(@@m, @@n)
    @board.draw_board
  end

  def create_player(player_number)
    puts "What is your name ?"
    player_name = gets.chomp
    @players[player_number] = Player.new(player_name)
  end

  def create_board(m, n)
    @board = Board.new(m, n)
  end

  def check_win

  end

  
  def game_turn
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
  
game = GameInterface.new("Tic-tac-toe")
# board = Board.new(3, 3)
# board.draw_board