class Engine

  def initialize
    new_game
  end

  def new_game
    @board = Board.new
    loop do
      puts "How do you want to play ?"
      puts "(1). Codebreaker || (2). Codemaker"
      print "> "
      answer = $stdin.gets.chomp.to_i
      if answer == 1
        codebreaker
      elsif answer == 2
        codemaker
      else
        puts "Please choose a playmode ?"
        redo
      end
    end
  end
  
  def game_over
    puts "You lose, I win!"
    end_game
  end
  
  def you_win
    puts "You won in #{12 - @turns}!"
    end_game
  end
  
  def end_game
    puts "New game? (Y/N)"
    print "> "
    answer = $stdin.gets.chomp.downcase
    if answer.include?("y")
      new_game
    else
      exit(0)
    end
  end
  
  def codebreaker
    @board.gen_code
    @turns = 12
    until @turns == 0 do
      puts "Guess a 4 numbers combination (1..6)"
      puts "#{@turns} turns left."
      print "> "
      response = $stdin.gets.chomp
      input = response.split("").map { |i| i.to_i }
      @board.guess(input)
      @turns -= 1
      @board.draw_board
      you_win if @board.win?
    end
    game_over
  end
  
  def codemaker
    @turns = 12
  end
  
end

class Board

  def initialize
    @board = {}
  end

  def gen_code
    @code = []
    4.times { @code << rand(1..6) }
    # TEST
    # @code = [1, 1, 2, 2]
  end
  
  def guess(input)
    clues_temp = {}
    clues = []
    guess = input
    guess.each_with_index do |e, i|
      if @code[i] == e
        clues_temp[i] = "B"
      elsif @code.include?(e) && !(clues_temp.has_key?(i))
        clues_temp[i] = "W"
      end
    end
    clues_temp.each { |_, v| clues << v }
    clues = clues.sort
    @board[input] = clues
  end
  
  def win?
    win = false
    @board.each do |_, clue|
      if (clue.length == 4) && (clue.all? { |i| i == "B" })
        win = true
      end
    end
    return win
  end

  def draw_board
    @board.each do |guess, clue|
      puts "| #{guess.join(" ")} |\t| #{clue.join(" ")} |"
    end
  end
end

game = Engine.new