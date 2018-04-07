class Engine

  def initialize
    # create Board
    @board = Board.new
    game_turn
  end

  def new_game
    
  end

  def game_turn
    @turns = 12
    until @turns == 0 do
      puts "You must guess a combination of 4 numbers (1..6)"
      puts "#{@turns} turns left."
      print "> "
      response = $stdin.gets.chomp
      # processes the input into an array
      input = response.split("").map { |i| i.to_i }
      @board.guess(input)
      @turns -= 1
      @board.draw_board
    end
  end

  def end_game
  end
end

class Board

  def initialize
    gen_code
    @board = {}
  end

  def guess(input)
    # compare the guess with @code and outputs the clues
    clues_temp = {}
    clues = []
    guess = input
    # compare the index and the value of the two arrays
    # if the value and the index are equal => black peg
    # if the value is included but the index doesn't match => white peg
    # Store the guesses and the associated responses in a hash
    # {[x1, X2, x3, x4] => [y1, y2, y3, y4]}
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

  def draw_board
    @board.each do |k, v|
      puts "#{k} ---> #{v}"
    end
    # displays the previous turns (x1, x2, x3, x4)
    # and the corresponding response (y1, y2, y3, y4)
  end

  private

  def gen_code
    @code = []
    # random hidden code generated, repetition permitted
    4.times { @code << rand(1..6) }
  end
end

game = Engine.new