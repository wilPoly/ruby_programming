class Engine

  def initialize
    # create Board
    @board = Board.new
  end

  def new_game
    
  end

  def game_turn
    @turns = 12
    until @turns == 0 do
      puts "You must guess a combination of 4 numbers (1..6)"
      puts "#{turns} turns left."
      print "> "
      response = $stdin.gets.chomp
      # processes the input into an array
      input = guess_raw.split("").map { |i| i.to_i }
      @board.guess(input)

      @turns -= 1
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
    # compare the index and the value of the two arrays
    # if the value and the index are equal => black peg
    # if the value is included but the index doesn't match => white peg
    @code.each_with_index do |i, j|
      input.each_with_index do |k, v| 
        ...
    # Store the guesses and the associated responses in a hash
    # {[x1, X2, x3, x4] => [y1, y2, y3, y4]}

  end

  def draw_board
    # displays the previous turns (x1, x2, x3, x4)
    # and the corresponding response (y1, y2, y3, y4)
  end

  private

  def gen_code
     @code = []
    # random hidden code generated
    4.times { @code << rand(1..6) }
  end




end