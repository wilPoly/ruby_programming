## => Tic-Tac-Toe
## => https://en.wikipedia.org/wiki/Tic-tac-toe
## => https://en.wikipedia.org/wiki/M,n,k-game

require './board'
require './player'

class Engine

  @@player_count = 0
  @@player_max = 2
  @@m = 3 #number of rows
  @@n = 3 #number of columns
  @@k = 3 #number of marks aligned to win

  attr_accessor :players

  def initialize(game_name)
    puts "Welcome to WilPoly's #{game_name}"
    # Create players
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

    # Create Board
    @board = Board.new(@@m, @@n)
    game_turn
  end

  def create_player(player_number, mark)
    puts "What is your name ?"
    player_name = $stdin.gets.chomp
    #Store player object in the player hash.
    @players[player_number] = Player.new(player_name, mark)
  end

  def create_board(m, n)
    @board = Board.new(m, n)
  end

  def check_win(player_number)
    @win_status = false
    #Itérer player_number et checker si win
    player_number = 1
    player = @players[player_number]
    mark = @players[player_number].mark

    while player_number <= @@player_count # a vérifier
      @board.status(mark, player) 
    end
    return @win_status
  end

  def game_turn
    player_number = 1
    while # continue tant qu'il n'y a pas de gagnant ou de match nul
      player = @players[player_number]
      puts "It's #{player.name}'s turn!"
      @board.draw_board
      position = 0
      @board.put_mark(position, player.mark)
      player_number += 1
      # if player_number == 1
      #   player_number = 2
      #   redo
      # else
      #   player_number = 1
      #   redo
      # end
    end
  end

end

  
game = Engine.new("Tic-tac-toe")

# board = Board.new(3, 3)
# board.draw_board