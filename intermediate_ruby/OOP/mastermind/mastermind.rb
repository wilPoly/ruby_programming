class Engine

  def initialize
    # create Board
    @board = Board.new
    game_turn
  end

  def new_game
    # refactor initialize
    # need option for codebreaker / codemaker
  end

  def game_turn
    @turns = 12
    until turns == 0 do
      puts "You must guess a combination of 4 numbers (1..6)"
      puts "#{@turns} turns left."
      print "> "
      response = $stdin.gets.chomp
      # processes the input into an array
      input = response.split("").map { |i| i.to_i }
      @board.guess(input)
      @turns -= 1
      @board.draw_board
      you_win if @board.win?
    end
    game_over
  end
  
  def game_over
    puts "You lost !"
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
end

class Board

  def initialize
    gen_code
    @board = {}
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
      win = true if clue.all?("B")
    end
    return win
  end

  def draw_board
    @board.each do |guess, clue|
      puts "| #{guess.join(" ")} |\t| #{clue.join(" ")} |"
    end
  end

  private

  def gen_code
    @code = []
    # random hidden code generated, repetition permitted
    4.times { @code << rand(1..6) }
  end
end

game = Engine.new