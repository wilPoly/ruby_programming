## => Tic-Tac-Toe
## => https://en.wikipedia.org/wiki/Tic-tac-toe

require './board'
require './player'

class Engine

  attr_accessor :players

  def initialize(game_name)
    puts "\n"
    puts "\t\tWelcome to WilPoly's #{game_name}"
    puts "\n"
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
    # @win = false
    # Create Board
    @board = Board.new
    game_turn
  end

  def game_turn
    player_number = 1
    loop do # until # @win == true # manque condition board_full
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

<<<<<<< HEAD
  def check_win(player_number)
    player = @players[player_number]
    if @board.status?(player.mark)
      puts "#{player.name} wins !"
      @board.draw_board
      player.score += 1
      puts "#{@players[1].name}: #{@players[1].score} | #{@players[2].name}: #{@players[2].score}\n"
      end_game
    end
  end

  def end_game
    response = false
    until response == true
      puts "Would you like to play again? Y/N"
      print "> "
      answer = $stdin.gets.chomp.downcase
      puts "\n"
      if answer.include?("y")
        new_game
        response = true
      elsif answer.include?("n")
        exit(0)
      else
        puts "What ?"
        redo
      end
    end
=======
#   def check_win(player_number)
#     player = @players[player_number]
#     row = @board.check_rows(player.mark)
#     column = @board.check_columns(player.mark)
#     diagonal = @board.check_diagonals(player.mark)
#     if row == true || column == true || diagonal == true
#       puts "#{player.name} wins !"
#       player.score += 1
#     end
    
>>>>>>> fd98de1bc2964ad2a8d77c69bba0d92d69c6762c
  end

end

  
game = Engine.new("Tic-tac-toe")

# board = Board.new(3, 3)
# board.draw_board