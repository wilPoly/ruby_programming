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
    new_game
  end

  def new_game
    ### Create players
    @players = {}
    player_number = 1
    mark = "X"
    while player_number <= @@player_max 
      puts "Player #{player_number}"
      #Assign marks to players
      if player_number == 1
        mark = "X"
      else
        mark = "O"
      end
      create_player(player_number, mark)
      player_number += 1
      @@player_count += 1
      puts "\n"
    end
    ###Create Board
    create_board(@@m, @@n)
    game_turn
  end

  def create_player(player_number, mark)
    puts "What is your name ?"
    player_name = gets.chomp
    #Store player object in the player hash.
    @players[player_number] = Player.new(player_name, mark)
  end

  def create_board(m, n)
    @board = Board.new(m, n)
  end

  def check_win
    #Itérer player_number et checker si win
    player_number = 1
    player = @players[player_number]
    mark = @players[player_number].mark
    while player_number <= @@player_count
      @board.check_rows(mark, player)
      @board.check_columns(mark, player)
    end
  end

  
  def game_turn
    @board.draw_board
    check_win
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