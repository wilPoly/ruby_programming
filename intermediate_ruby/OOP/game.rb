## => Tic-Tac-Toe
## => https://en.wikipedia.org/wiki/Tic-tac-toe

require './board'
require './player'

class Engine

  attr_accessor :players

  def initialize(game_name)
    puts "Welcome to WilPoly's #{game_name}"
    # Create players
    @players = {}
    puts "Player 1"
    create_player(1, "X")
    puts "\n"
    puts "Player 2"
    create_player(2, "O")
    puts "\n"
    new_game
  end

  def create_player(player_number, mark)
    puts "What is your name ?"
    player_name = $stdin.gets.chomp
    #Store player object in the player hash.
    @players[player_number] = Player.new(player_name, mark) #maybe a Struct?
  end

  def new_game
  # Create Board
    @board = Board.new
    game_turn
  end

  def game_turn
    player_number = 1
    loop do # continue tant qu'il n'y a pas de gagnant ou de match nul
      player = @players[player_number]
      puts "It's #{player.name}'s turn!"
      @board.draw_board
      position = 0
      @board.put_mark(position, player.mark)
      check_win(player_number)
      if player_number == 1
        player_number = 2
      else
        player_number = 1
      end
    end
  end

  def check_win(player_number)
    player = @players[player_number]
    row = @board.check_rows(player.mark)
    column = @board.check_columns(player.mark)
    diagonal = @board.check_diagonals(player.mark)
    if row || column || diagonal
      puts "#{player.name} wins !"
      player.score += 1
    end
    
  end

end

  
game = Engine.new("Tic-tac-toe")

# board = Board.new(3, 3)
# board.draw_board